variable "github_org" {
  type        = string
}

variable "github_repository" {
  type        = string
}

variable "github_token" {
  type        = string
  sensitive = true
}