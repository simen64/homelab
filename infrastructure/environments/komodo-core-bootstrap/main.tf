module "coreos-download-proxmox" {
  source = "../../modules/coreos-download-proxmox"
  node_name = var.node_name
}

module "butane-transpile" {
  source = "../../modules/butane-transpile"
  file_location = var.file_location
  template_vars = local.template_vars
}

module "coreos-vm" {
  source           = "../../modules/coreos-vm"
  proxmox_ssh_key  = var.proxmox_ssh_key
  virtual_machines = var.virtual_machines
  file_id          = module.coreos-download-proxmox.file_id
  ignition         = module.butane-transpile.ignition
}