variable "cluster_name" {
  type    = string
  default = "homelab"
}

variable "github_org" {
  type        = string
  default     = "simen64"
}

variable "github_repository" {
  type        = string
  default     = "homelab"
}

variable "default_gateway" {
  type    = string
  default = "192.168.50.1"
}

variable "node_name" {
  type = string
  default = "pve-1"
}

variable "dns_url" {
  type = string
  default = "dns.simenmo.com"
}

variable "dns_ip" {
  type = string
  default = "192.168.50.238"
}

variable "control_plane_url" {
  type = string
  default = "controlplane.k8s.simen"
}

variable "install_disk" {
  type = string
  default = "/dev/vda"
}

variable "github_token" {
  type        = string
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
  default = [
    {
      name       = "talos-cp-01"
      node_name  = "pve-1"
      cpu_cores  = 2
      memory     = 4096
      ip_address = "192.168.50.151"
      id         = 301
    }
  ]
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
  default = [
    {
      name       = "talos-worker-01"
      node_name  = "pve-1"
      cpu_cores  = 2
      memory     = 2048
      ip_address = "192.168.50.201"
      id         = 401
    }
  ]
}


