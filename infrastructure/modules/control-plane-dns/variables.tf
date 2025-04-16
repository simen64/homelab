variable "nextdns_profile_id" {
  type = string
}

variable "nextdns_api_key" {
  type        = string
  sensitive = true
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


