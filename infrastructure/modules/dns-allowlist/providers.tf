terraform {
  required_providers {
    adguard = {
      source = "gmichels/adguard"
      version = "1.6.2"
    }
  }
}

provider "adguard" {
    host     = var.provider_url
    username = var.provider_username
    password = var.provider_key
    scheme   = "http" # defaults to https
    insecure = true  # when `true` will skip TLS validation
}