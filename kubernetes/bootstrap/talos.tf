resource "talos_machine_secrets" "machine_secrets" {}

data "talos_client_configuration" "talosconfig" {
  cluster_name         = var.cluster_name
  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  nodes                = [for i in local.vms : "${i.ip_address}"]
  endpoints            = [for i in var.control_plane_vms : "${i.ip_address}"]
}

data "talos_machine_configuration" "machineconfig_cp" {
  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${var.control_plane_url}:6443"
  machine_type     = "controlplane"
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets

  config_patches = [
    yamlencode({
      machine = {
        install = {
          disk = var.install_disk
        }
        features = {
          hostDNS = {
            enabled = true
          }
        }
      }
    })
  ]
}

data "talos_machine_configuration" "machineconfig_worker" {
  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${var.control_plane_url}:6443"
  machine_type     = "worker"
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets

  config_patches = [
    yamlencode({
      machine = {
        install = {
          disk = var.install_disk
        }
        features = {
          hostDNS = {
            enabled = true
          }
        }
      }
    })
  ]
}


resource "talos_machine_configuration_apply" "cp_config_apply" {
  depends_on                  = [
    proxmox_virtual_environment_vm.control_plane_vms,
    proxmox_virtual_environment_firewall_options.standard_rules,
    proxmox_virtual_environment_firewall_rules.control_plane_rules
    ]

  for_each   = {
    for index, vm in var.control_plane_vms:
    vm.name => vm
  }

  client_configuration        = talos_machine_secrets.machine_secrets.client_configuration
  machine_configuration_input = data.talos_machine_configuration.machineconfig_cp.machine_configuration
  node                        = each.value.ip_address
  endpoint = each.value.ip_address

  config_patches = [
    yamlencode({
      machine = {
        network = {
          interfaces = [
            {
              interface = "eth1"
              dhcp = false
              addresses = ["${each.value.ip_address}/24"]
              routes = [
                { network = "0.0.0.0/0", gateway = var.default_gateway }
              ]
            }
          ]
        }
      }
    })
  ]

}

resource "talos_machine_configuration_apply" "worker_config_apply" {
  depends_on                  = [
    proxmox_virtual_environment_vm.worker_vms,
    proxmox_virtual_environment_firewall_options.standard_rules,
    proxmox_virtual_environment_firewall_rules.worker_rules
    ]

  for_each   = {
    for index, vm in var.worker_vms:
    vm.name => vm
  }

  client_configuration        = talos_machine_secrets.machine_secrets.client_configuration
  machine_configuration_input = data.talos_machine_configuration.machineconfig_worker.machine_configuration
  node                        = each.value.ip_address
  endpoint = each.value.ip_address

  config_patches = [
    yamlencode({
      machine = {
        network = {
          interfaces = [
            {
              interface = "eth1"
              dhcp = false
              addresses = ["${each.value.ip_address}/24"]
              routes = [
                { network = "0.0.0.0/0", gateway = var.default_gateway }
              ]
            }
          ]
        }
      }
    })
  ]
}


resource "talos_machine_bootstrap" "bootstrap" {
  depends_on           = [talos_machine_configuration_apply.cp_config_apply]

  timeouts = {
    create = "5m"
  }

  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  node                 = var.control_plane_vms[0].ip_address
  endpoint             = var.control_plane_vms[0].ip_address
}

data "talos_cluster_health" "health" {
  depends_on           = [ talos_machine_bootstrap.bootstrap ]
  client_configuration = data.talos_client_configuration.talosconfig.client_configuration
  control_plane_nodes  = [for i in var.control_plane_vms : "${i.ip_address}"]
  worker_nodes         = [for i in var.worker_vms : "${i.ip_address}"]
  endpoints            = [for i in var.control_plane_vms : "${i.ip_address}"]
}

resource "talos_cluster_kubeconfig" "kubeconfig" {
  depends_on           = [data.talos_cluster_health.health]

  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  node                 = var.control_plane_vms[0].ip_address

  timeouts = {
    create = "3m"
  }
}

output "client_configuration" {
  value     = data.talos_client_configuration.talosconfig
  sensitive = true
}

output "kube_config_raw" {
  value     = talos_cluster_kubeconfig.kubeconfig.kubeconfig_raw
  sensitive = true
}

output "kube_config" {
  value     = talos_cluster_kubeconfig.kubeconfig
  sensitive = true
}

resource "local_file" "kubeconfig" {
  content  = talos_cluster_kubeconfig.kubeconfig
  filename = "./kubeconfig"
}

output "machine_config" {
  value = data.talos_machine_configuration.machineconfig_cp
  sensitive = true
}
	
