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
    adguard = {
      source = "gmichels/adguard"
      version = "1.5.0"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.5.0"
    }
  }
}
