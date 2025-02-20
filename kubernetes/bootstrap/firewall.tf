resource "proxmox_virtual_environment_firewall_options" "standard_rules" {
  depends_on = [
    proxmox_virtual_environment_vm.control_plane_vms,
    proxmox_virtual_environment_vm.worker_vms,
    proxmox_virtual_environment_firewall_rules.control_plane_rules,
    proxmox_virtual_environment_firewall_rules.worker_rules
  ]

  for_each = local.vms

  node_name = var.node_name
  vm_id = each.value.id

  enabled       = true
  log_level_in  = "info"
  log_level_out = "info"
  input_policy  = "DROP"
  output_policy = "ACCEPT"
}

resource "proxmox_virtual_environment_firewall_rules" "control_plane_rules" {
  depends_on = [
    proxmox_virtual_environment_vm.control_plane_vms
  ]

  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  node_name = var.node_name
  vm_id = each.value.id

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "talosctl, control plane nodes"
    dport   = "50000"
    proto   = "tcp"
    log     = "info"
  }

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "talos, Worker nodes"
    dport   = "50001"
    proto   = "tcp"
    log     = "info"
  }

  rule {
  type    = "in"
  action  = "ACCEPT"
  comment = "Kubernetes API server"
  dport   = "6443"
  proto   = "tcp"
  log     = "info"
  }

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "etcd server client API"
    dport   = "2379:2380"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "Kubelet API"
    dport   = "10250"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "kube-scheduler"
    dport   = "10259"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "kube-controller-manager"
    dport   = "10257"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "out"
    action  = "ACCEPT"
    comment = "Kubelet API"
    dport   = "10250"
    proto   = "tcp"
    log     = "info"
  }
}

resource "proxmox_virtual_environment_firewall_rules" "worker_rules" {
  depends_on = [
    proxmox_virtual_environment_vm.worker_vms
  ]

  for_each   = {
    for index, vm in var.worker_vms:
    vm.name => vm
  }

  node_name = var.node_name
  vm_id = each.value.id

  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "talos, apid"
    dport   = "50000"
    proto   = "tcp"
    log     = "info"
  }
    
  rule {
  type    = "in"
  action  = "ACCEPT"
  comment = "Kubelet API"
  dport   = "10250"
  proto   = "tcp"
  log     = "info"
  }
  
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "kube-proxy"
    dport   = "10256"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "in"
    action  = "ACCEPT"
    comment = "NodePort Services"
    dport   = "30000:32767"
    proto   = "tcp"
    log     = "info"
  }
  
  rule {
    type    = "out"
    action  = "ACCEPT"
    comment = "External services"
    dport   = "443"
    proto   = "tcp"
    log     = "info"
  }
}