variable "blocklists" {
  type = list(object({
    name = string
    url  = string
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