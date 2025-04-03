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

variable "dns_ip" {
  type = string
  default = "45.90.28.43"
}

variable "dns_search_domain" {
  type = string
  default = "k8s.simen"
}

variable "nextdns_profile_id" {
  type = string
  default = "5e12fe"
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
  sensitive = true
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
    },
    {
      name       = "talos-worker-02"
      node_name  = "pve-1"
      cpu_cores  = 2
      memory     = 2048
      ip_address = "192.168.50.202"
      id         = 402
    },
    {
      name       = "talos-worker-03"
      node_name  = "pve-1"
      cpu_cores  = 2
      memory     = 2048
      ip_address = "192.168.50.203"
      id         = 403
    }
  ]
}


