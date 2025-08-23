resource "adguard_rewrite" "rewrite" {
  for_each = {
    for index, rewrite in var.rewrites:
    rewrite.domain => rewrite
  }

  domain = each.value.domain
  answer = each.value.answer
}