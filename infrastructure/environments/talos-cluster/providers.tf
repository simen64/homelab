terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.88.0"
    }
    talos = {
      source = "registry.terraform.io/siderolabs/talos"
      version = "0.9.0"
    }
    flux = {
      source = "fluxcd/flux"
      version = "1.7.6"
    }
    opnsense = {
      source = "browningluke/opnsense"
      version = "0.16.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_endpoint
  api_token = var.proxmox_ve_api_token
  ssh {
    agent = false
    username = "root"
    private_key = file(var.proxmox_ssh_key)
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

provider "opnsense" {
  uri = var.opnsense_uri
  api_key = var.opnsense_api_key
  api_secret = var.opnsense_api_secret
  allow_insecure = true
}
