variable "proxmox_host" {
  type        = string
  default = "192.168.20.220"
}

variable "proxmox_endpoint" {
  type = string
  default = "https://pve-1.simenmo.com:8006/"
}

variable "node_name" {
  default = "pve-1"
}

variable "proxmox_username" {
  type      = string
  sensitive = true
  default   = "root@pam"
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type = string
  sensitive = true
  default = "./id_ed25519"
}

variable "template_vars_env" {
  type    = map(string)
  default = {}
}

variable "virtual_machines" {
  type = list(object({
    name        = string
    node_name   = string
    cpu_cores   = number
    memory      = number
    disk_size   = number
    datastore_id = string
    id          = number
    ip          = string
    gateway_ip  = string
    dns_ip      = string
    hostname    = string
    butane_path = string
    # Optional PCI passthrough
    hostpci     = optional(object({
      device = string
      id     = string
    }))
  }))
  default = [
    {
      name        = "komodo-agent-cloud-vm"
      node_name   = "pve-1"
      cpu_cores   = 4
      memory      = 8192
      disk_size   = 1768
      datastore_id = "storage"
      id          = 501
      ip          = "192.168.20.51"
      gateway_ip  = "192.168.20.1"
      dns_ip      = "192.168.20.50"
      hostname    = "securecore-komodo-agent-cloud"
      butane_path = "./ucore-autorebase-agent.butane.tftpl" 
    },
    {
      name        = "komodo-agent-gpu-vm"
      node_name   = "pve-1"
      cpu_cores   = 4
      memory      = 8192
      disk_size   = 1768
      datastore_id = "media"
      id          = 502
      ip          = "192.168.20.52"
      gateway_ip  = "192.168.20.1"
      dns_ip      = "192.168.20.50"
      hostname    = "securecore-komodo-agent-gpu"
      butane_path = "./ucore-autorebase-agent-gpu.butane.tftpl" 
      hostpci     = {device = "hostpci0", id = "0000:01:00.0"}
    }
  ]
}
