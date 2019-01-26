resource "digitalocean_droplet" "_" {
  image    = "ubuntu-18-04-x64"
  name     = "jenkins"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
  backups  = true
  ssh_keys = ["${digitalocean_ssh_key._.id}"]
}

data "digitalocean_domain" "_" {
  name = "${var.domain}"
}

resource "digitalocean_record" "_" {
  domain = "${data.digitalocean_domain._.name}"
  name   = "${var.subdomain}"
  type   = "A"
  ttl    = 10
  value  = "${digitalocean_droplet._.ipv4_address}"
}
