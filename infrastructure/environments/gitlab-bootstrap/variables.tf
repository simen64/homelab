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

variable "node_name" {
  type = string
  default = "pve-1"
}

variable "file_name" {
  type = string
  default = "gitlab-bootc.iso"
}

variable "path" {
  type = string
  default = "../../../images/gitlab-bootc/qcow2/disk.qcow2"
}