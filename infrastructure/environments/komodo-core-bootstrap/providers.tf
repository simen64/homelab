terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    local = {
      source = "hashicorp/local"
      version = "2.5.3"
    }
    proxmox = {
      source = "bpg/proxmox"
      version = "0.86.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  insecure = true
  username = var.proxmox_username
  password = var.proxmox_password
  ssh {
    agent = false
    username = "root"
    private_key = file("./id_ed25519")
  }
}