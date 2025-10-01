module "coreos-download-proxmox" {
  source = "../../modules/coreos-download-proxmox"
  node_name = var.node_name
}

locals {
  # Map VMs keyed by name
  vms = {
    for vm in var.virtual_machines :
    vm.name => vm
  }
}

# Merge VM core info with environment template vars and pass to butane-transpile
module "butane-transpile" {
  source        = "../../modules/butane-transpile"
  for_each      = local.vms
  file_location = each.value.butane_path

  template_vars = merge(
    {
      ip         = each.value.ip
      gateway_ip = each.value.gateway_ip
      dns_ip     = each.value.dns_ip
      hostname   = each.value.hostname
    },
    var.template_vars_env
  )
}

locals {
  vms_for_coreos_vm = [
    for vm in var.virtual_machines : merge({
      name       = vm.name
      node_name  = vm.node_name
      cpu_cores  = vm.cpu_cores
      memory     = vm.memory
      disk_size  = vm.disk_size
      datastore_id = vm.datastore_id
      id         = vm.id
      ignition   = module.butane-transpile[vm.name].ignition
    },
    # Only include hostpci if it exists
    vm.hostpci != null ? { hostpci = vm.hostpci } : {}
    )
  ]
}

module "coreos-vm" {
  source           = "../../modules/coreos-vm"
  proxmox_ssh_key  = var.proxmox_ssh_key
  file_id          = module.coreos-download-proxmox.file_id

  virtual_machines = local.vms_for_coreos_vm
}
