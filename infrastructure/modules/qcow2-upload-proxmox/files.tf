resource "null_resource" "upload_qcow2" {
  provisioner "file" {
    source      = var.local_path
    destination = var.remote_path

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = file(var.private_key_path)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "ls -lh ${var.remote_path}",
    ]

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = file(var.private_key_path)
    }
  }
}
