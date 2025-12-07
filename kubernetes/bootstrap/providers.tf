terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.89.0"
    }
    talos = {
      source = "siderolabs/talos"
      version = "0.9.0"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.7.6"
    }
    nextdns = {
      source = "registry.terraform.io/carbans/nextdns"
      version = "0.2.2"
    }
  }
}
