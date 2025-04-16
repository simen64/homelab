module "flux-bootstrap" {
  depends_on = [ module.talos-bootstrap ]

  source = "../../modules/flux-bootstrap"

  github_token = var.github_token
  github_org = var.github_org
  github_repository = var.github_repository

}