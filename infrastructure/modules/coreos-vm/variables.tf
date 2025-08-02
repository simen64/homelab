variable "proxmox_ssh_key" {
  type = string
}

variable "file_id" {
  type = string
}

variable "ignition" {
  type = string
}

variable "virtual_machines" {
  type = list(object({
    name        = string
    node_name   = string
    cpu_cores   = number
    memory      = number
    id          = number
  }))
}