terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.72.0"
    }
    talos = {
      source = "siderolabs/talos"
      version = "0.7.1"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.7.3"
    }
    nextdns = {
      source = "registry.terraform.io/carbans/nextdns"
      version = "0.2.2"
    }
  }
}
