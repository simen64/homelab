locals {
  vms = merge(
    { for k, v in var.control_plane_vms : k => merge(v, { group = "control-plane" }) },
    { for k, v in var.worker_vms : k => merge(v, { group = "worker" }) }
  )
}
