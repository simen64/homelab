variable "proxmox_ssh_key" {
  type = string
}

variable "file_id" {
  type = string
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
    ignition    = string
    hostpci    = optional(object({
      device = string
      id     = string
    }))
  }))
}
