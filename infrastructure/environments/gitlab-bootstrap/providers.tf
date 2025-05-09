terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.72.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  api_token = var.proxmox_ve_api_token
  ssh {
    agent = false
    username = "root"
    private_key = file("./id_ed25519")
  }
}