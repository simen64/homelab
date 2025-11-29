module "flux-bootstrap" {
  source = "../../modules/kubernetes/flux-bootstrap"

  github_token = var.github_token
  github_org = var.github_org
  github_repository = var.github_repository

}
