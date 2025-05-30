resource "null_resource" "start_vm" {
    depends_on = [ null_resource.import_disk ]

    for_each   = {
    for index, vm in var.virtual_machines:
    vm.name => vm
    }

    provisioner "remote-exec" {
    inline = [
        "qm start ${each.value.id}"
    ]

    connection {
        type        = "ssh"
        host        = var.proxmox_host
        user        = var.proxmox_user
        private_key = file(var.private_key_path)
    }
    }
}
