resource "proxmox_virtual_environment_vm" "bootc_vms" {
  for_each   = {
    for index, vm in var.virtual_machines:
    vm.name => vm
  }

  name       = each.value.name
  description = "Managed by OpenTofu"
  tags        = ["opentofu"]

  node_name   = each.value.node_name
  vm_id       = each.value.id

  on_boot     = true

  started     = true

  cpu {
    cores = each.value.cpu_cores
    type  = "host"
  }

  memory {
    dedicated = each.value.memory
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    firewall = true
  }

  disk {
    datastore_id = "containers-vms"
    file_id      = var.file_id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26"
  }

  kvm_arguments = "-fw_cfg 'name=opt/com.coreos/config,string=${replace(var.ignition, ",", ",,")}'"
}