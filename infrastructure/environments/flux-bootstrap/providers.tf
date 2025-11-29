terraform {
  required_providers {
    flux = {
      source = "fluxcd/flux"
      version = "1.7.6"
    }
  }
}

provider "flux" {
  kubernetes = {
    config_path = "../talos-cluster/kubeconfig"
  }
  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}
