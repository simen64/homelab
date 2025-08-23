module "dns-allowlist" {
  source = "../../modules/dns-allowlist"
  provider_url = var.provider_url
  provider_username = var.provider_username
  provider_key = var.provider_key
  allowlists = var.allowlists
}

module "dns-blocklists" {
  source = "../../modules/dns-blocklist"
  provider_url = var.provider_url
  provider_username = var.provider_username
  provider_key = var.provider_key
  blocklists = var.blocklists
}

module "dns-rewrite" {
  provider_url = var.provider_url
  provider_username = var.provider_username
  provider_key = var.provider_key
  source = "../../modules/dns-rewrite"
  rewrites = var.rewrites
}