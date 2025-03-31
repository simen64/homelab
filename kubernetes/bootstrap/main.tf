provider "proxmox" {
  endpoint = "https://pve-1.simenmo.com:8006/"
  api_token = var.proxmox_ve_api_token
  ssh {
    agent = false
    username = "root"
    private_key = file("~/.ssh/id_ed25519")
  }
}

variable "proxmox_ve_api_token" {
  type      = string
  sensitive = true
}

variable "nextdns_api_key" {
  type      = string
  sensitive = true
}

provider "nextdns" {
  api_key = var.nextdns_api_key
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