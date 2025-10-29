terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.86.0"
    }
    talos = {
      source = "registry.terraform.io/siderolabs/talos"
      version = "0.9.0"
    }
    nextdns = {
      source = "registry.terraform.io/carbans/nextdns"
      version = "0.2.2"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.7.4"
    }
  }
}

provider "nextdns" {
  api_key = var.nextdns_api_key
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

provider "flux" {
  kubernetes = {
    config_path = "./kubeconfig"
  }
  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}