resource "flux_bootstrap_git" "this" {
  depends_on = [local_file.kubeconfig]

  embedded_manifests = true
  path               = "kubernetes/flux"
}