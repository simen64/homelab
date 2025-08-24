variable "proxmox_ve_api_token" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type = string
  default = "./id_ed25519"
}

variable "proxmox_endpoint" {
  type = string
  default = "https://pve-1.simenmo.com:8006/"
}

variable "cluster_name" {
  type    = string
  default = "homelab"
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
  default = "192.168.20.50"
}

variable "dns_search_domain" {
  type = string
  default = "k8s.simen"
}

variable "control_plane_url" {
  type = string
  default = "controlplane.k8s.simen"
}

variable "install_disk" {
  type = string
  default = "/dev/vda"
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
  default = []
}


