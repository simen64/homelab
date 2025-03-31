resource "flux_bootstrap_git" "this" {
  depends_on = [local_file.kubeconfig]

  timeouts = {
    create = "3m"
  }

  embedded_manifests = true
  path               = "kubernetes/flux"
}
