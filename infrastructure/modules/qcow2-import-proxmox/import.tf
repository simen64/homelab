resource "null_resource" "import_disk" {
  for_each   = {
    for index, vm in var.virtual_machines:
    vm.name => vm
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = file(var.private_key_path)
    }

    inline = [
      "qm importdisk ${each.value.id} ${var.remote_path} containers-vms",

      "qm set ${each.value.id} --scsihw virtio-scsi-pci --scsi0 containers-vms:vm-${each.value.id}-disk-0",

      "qm set ${each.value.id} --boot c --bootdisk scsi0"
    ]
  }
}
