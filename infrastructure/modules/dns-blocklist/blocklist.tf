resource "adguard_list_filter" "test_whitelist" {
  for_each = {
    for index, allowlist in var.blocklists:
    allowlist.name => allowlist
  }

  name      = each.value.name
  url       = each.value.url
  enabled   = true
  whitelist = false
}