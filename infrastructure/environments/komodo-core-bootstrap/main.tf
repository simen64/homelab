module "coreos-download-proxmox" {
  source = "../../modules/coreos-download-proxmox"
  node_name = var.node_name
}