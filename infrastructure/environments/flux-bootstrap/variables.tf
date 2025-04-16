variable "github_org" {
  type        = string
  default     = "simen64"
}

variable "github_repository" {
  type        = string
  default     = "homelab"
}

variable "github_token" {
  type        = string
  sensitive = true
}