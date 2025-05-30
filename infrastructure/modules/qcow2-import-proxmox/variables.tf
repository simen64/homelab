variable "proxmox_host" {
  type        = string
}

variable "proxmox_user" {
  type        = string
  default     = "root"
}

variable "private_key_path" {
  type        = string
  sensitive   = true
}

variable "local_path" {
  type        = string
}

variable "remote_path" {
  type        = string
  default     = "/var/lib/vz/template/qcow2/uploaded_image.qcow2"
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