provider "digitalocean" {
  token = "${var.do_token}"
}

provider "acme" {
  server_url = "${var.server_url}"
}
