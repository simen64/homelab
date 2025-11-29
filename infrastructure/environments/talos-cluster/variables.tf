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
  default = "192.168.20.1"
}

variable "opnsense_uri" {
  type = string
  default = "https://192.168.20.1"
}

variable "opnsense_api_key" {
  type        = string
  sensitive = true
}

variable "opnsense_api_secret" {
  type        = string
  sensitive = true
}

variable "node_name" {
  type = string
  default = "pve-1"
}

variable "dns_ip" {
  type = string
  default = "192.168.20.1"
}

variable "dns_search_domain" {
  type = string
  default = "k8s.simen"
}

variable "control_plane_url" {
  type = string
  default = "controlplane.k8s.simen"
}

variable "control_plane_host" {
  type = string
  default = "controlplane"
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
      ip_address = "192.168.20.200"
      id         = 300
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
      ip_address = "192.168.20.210"
      id         = 310
    },
    {
      name       = "talos-worker-02"
      node_name  = "pve-1"
      cpu_cores  = 2
      memory     = 2048
      ip_address = "192.168.20.211"
      id         = 311
    }
  ]
}


