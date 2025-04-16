resource "flux_bootstrap_git" "this" {

  embedded_manifests = false
  path               = "kubernetes/flux"
}
