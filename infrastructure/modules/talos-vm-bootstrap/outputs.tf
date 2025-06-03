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
  content  = talos_cluster_kubeconfig.kubeconfig.kubeconfig_raw
  filename = "./kubeconfig"
}

output "machine_config" {
  value = data.talos_machine_configuration.machineconfig_cp
  sensitive = true
}