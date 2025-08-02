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

variable "template_vars_local" {
  type = map(string)
  default = {
    "ip" = "192.168.20.50",
    "gateway_ip" = "192.168.20.1",
    "dns_ip" = "8.8.8.8",
    "hostname" = "securecore-komodo"
  }
}

locals {
  template_vars = merge(var.template_vars_local, var.template_vars_env)
}

variable "file_location" {
  type = string
  default = "./ucore-autorebase.butane.tftpl"
}

variable "virtual_machines" {
  type = list(object({
    name        = string
    node_name   = string
    cpu_cores   = number
    memory      = number
    id          = number
  }))
  default = [
    {
      name       = "komodo-core-vm"
      node_name  = "pve-1"
      cpu_cores  = 4
      memory     = 8192
      id         = 500
    }
  ]
}