variable "proxmox_ve_api_token" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type = string
}

variable "proxmox_endpoint" {
  type = string
}

variable "node_name" {
  type = string
}

variable "control_plane_vms" {
  type = list(object({
    name        = string
    node_name   = string
    cpu_cores   = number
    memory      = number
    ip_address  = string
    id          = number
  }))
}

variable "worker_vms" {
  type = list(object({
    name        = string
    node_name   = string
    cpu_cores   = number
    memory      = number
    ip_address  = string
    id          = number
  }))
}