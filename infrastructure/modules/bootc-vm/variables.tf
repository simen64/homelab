variable "proxmox_ve_api_token" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type = string
}

variable "disk" {
  description = "Whether to create a disk"
  type        = bool
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
    qcow2_file_id  = string
    id          = number
  }))
}