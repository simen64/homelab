resource "proxmox_virtual_environment_file" "file_upload" {
  datastore_id = "local"
  node_name    = var.node_name
  content_type = "images"

  source_file {
    file_name = var.file_name
    path = var.path
  }
}