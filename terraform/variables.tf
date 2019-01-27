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

variable "droplet_size" {
  default = "s-2vcpu-2gb"
}

variable "droplet_region" {
  default = "ams3"
}

variable "droplet_name" {
  default = "jenkins"
}

variable "droplet_backups" {
  default = true
}