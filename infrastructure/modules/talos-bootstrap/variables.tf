variable "cluster_name" {
  type    = string
}

variable "default_gateway" {
  type    = string
}

variable "install_disk" {
  type = string
}

variable "control_plane_url" {
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


