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

variable "adguard_username" {
  type      = string
  sensitive = true
}

variable "adguard_password" {
  type      = string
  sensitive = true
}

provider "adguard" {
  host     = var.dns_url
  username = var.adguard_username
  password = var.adguard_password
  scheme   = "https" # defaults to https
  timeout  = 10
  insecure = false
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