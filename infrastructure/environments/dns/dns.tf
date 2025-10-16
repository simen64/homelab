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

resource "adguard_config" "configuration" {
  querylog = {
    enabled = true
  }

  blocked_services = ["temu", "shein"]

  dns = {
    upstream_dns = ["https://dns.quad9.net/dns-query", "https://dns.mullvad.net/dns-query"]

    fallback_dns = ["https://dns.cloudflare.com/dns-query", "https://dns.google/dns-query", "1.1.1.1", "1.0.0.1", "8.8.8.8", "8.8.4.4"]

    upstream_mode = "parallel"
  }
}
