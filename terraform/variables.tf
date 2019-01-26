variable "do_token" {}

variable "domain" {}

variable "subdomain" {
  default = "jenkins"
}

variable "email_address" {}

variable "server_url" {
  default = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "admin_password" {
  type = "string"
}
