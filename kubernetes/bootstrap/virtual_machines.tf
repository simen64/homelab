resource "proxmox_virtual_environment_vm" "control_plane_vms" {
  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  name       = each.value.name
  description = "Managed by Terraform"
  tags        = ["terraform"]

  node_name   = each.value.node_name
  vm_id       = each.value.id

  on_boot     = true

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
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26"
  }

  initialization {
    datastore_id = "local-zfs"
    ip_config {
      ipv4 {
        address = "${each.value.ip_address}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
    dns {
      domain = "k8s.com"
      servers = [var.dns_ip]
    }
  }

  network_device {
    firewall = true
  }
}

resource "proxmox_virtual_environment_vm" "worker_vms" {
  for_each   = {
    for index, vm in var.worker_vms:
    vm.name => vm
  }

  name       = each.value.name
  description = "Managed by Terraform"
  tags        = ["terraform"]

  node_name   = each.value.node_name
  vm_id       = each.value.id

  on_boot     = true

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
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_download_file.talos_nocloud_image.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  operating_system {
    type = "l26"
  }

  initialization {
    datastore_id = "local-zfs"
    ip_config {
      ipv4 {
        address = "${each.value.ip_address}/24"
        gateway = var.default_gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
    dns {
      domain = "k8s.com"
      servers = [var.dns_ip]
    }
  }

  network_device {
    firewall = true
  }
}