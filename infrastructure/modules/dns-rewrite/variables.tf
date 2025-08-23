variable "rewrites" {
  type = list(object({
    domain = string
    answer = string
  }))
  default = []
}

variable "provider_url" {
  type = string
}

variable "provider_username" {
  type = string
  default = null
}

variable "provider_key" {
  type = string
  sensitive = true
}