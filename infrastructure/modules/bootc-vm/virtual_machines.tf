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

  started     = false

  cpu {
    cores = each.value.cpu_cores
    type  = "x86-64-v2-AES"
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

  dynamic "disk" {
    for_each = var.disk ? [1] : []
    content {
      size        = 50
      datastore_id = "containers-vms"
      file_format = "qcow2"
      file_id      = each.value.file_id
      interface    = "virtio0"
    }
  }

  operating_system {
    type = "l26"
  }
}