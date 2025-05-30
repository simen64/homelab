variable "proxmox_host" {
  type        = string
  default = "192.168.20.220"
}

variable "proxmox_endpoint" {
  type = string
  default = "https://pve-1.simenmo.com:8006/"
}

variable "node_name" {
  default = "pve-1"
}

variable "local_path" {
  type        = string
  default = "../../../images/komodo-bootc/output/qcow2/disk.qcow2"
}

variable "remote_path" {
  type        = string
  default     = "/var/lib/vz/template/qcow2/komodo-bootc.qcow2"
}

variable "proxmox_ve_api_token" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type = string
  sensitive = true
  default = "./id_ed25519"
}

variable "disk" {
  description = "Whether to create a disk"
  type        = bool
  default = false
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
  default = [
    {
      name       = "komodo-core-vm"
      node_name  = "pve-1"
      cpu_cores  = 4
      memory     = 8192
      qcow2_file_id = "local:qcow2/komodo-bootc.qcow2"
      id         = 500
    }
  ]
}