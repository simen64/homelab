resource "flux_bootstrap_git" "this" {
  depends_on = [local_file.kubeconfig]

  embedded_manifests = false
  path               = "kubernetes/flux"
}
