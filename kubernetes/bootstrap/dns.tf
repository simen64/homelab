resource "adguard_rewrite" "control_plane_dns" {
  depends_on = [
    proxmox_virtual_environment_vm.control_plane_vms
  ]

  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  domain = var.control_plane_url
  answer = each.value.ip_address

}