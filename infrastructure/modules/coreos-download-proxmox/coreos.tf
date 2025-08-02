locals {
  metadata = jsondecode(data.http.coreos_stable_metadata.response_body)

  coreos_qemu_stable = local.metadata.architectures.x86_64.artifacts.qemu.formats["qcow2.xz"].disk
  download_url       = local.coreos_qemu_stable.location
  download_sum       = local.coreos_qemu_stable.sha256
}

data "http" "coreos_stable_metadata" {
  url = "https://builds.coreos.fedoraproject.org/streams/stable.json"
}

resource "proxmox_virtual_environment_download_file" "coreos_img" {
  content_type  = "iso"
  datastore_id  = "local"
  node_name     = "pve-1"

  url      = local.download_url
  checksum = local.download_sum

  checksum_algorithm      = "sha256"
  decompression_algorithm = "zst"

  upload_timeout = 1440

  file_name = "coreos-qemu.qcow2.xz.img"
}

output "file_id" {
  value = proxmox_virtual_environment_download_file.coreos_img.id
}