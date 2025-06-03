resource "nextdns_rewrite" "control_plane_dns" {

  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  profile_id = var.nextdns_profile_id

    rewrite {
    address = each.value.ip_address
    domain = var.control_plane_url
  }

}