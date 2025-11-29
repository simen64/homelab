
resource "opnsense_unbound_host_override" "a_override" {
  enabled = true
  description = "A record override"

  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  hostname = var.control_plane_host
  domain = var.control_plane_url
  server = each.value.ip_address
}
