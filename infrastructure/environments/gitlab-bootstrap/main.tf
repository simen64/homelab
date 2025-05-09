module "bootc-vm" {
  source = "../../modules/bootc-vm"

  node_name = var.node_name
  file_name = var.file_name
  path = var.path

}