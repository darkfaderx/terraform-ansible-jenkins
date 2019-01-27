resource "digitalocean_droplet" "_" {
  image    = "ubuntu-18-04-x64"
  name     = "${var.droplet_name}"
  region   = "${var.droplet_region}"
  size     = "${var.droplet_size}"
  backups  = "${var.droplet_backups}"
  ssh_keys = ["${digitalocean_ssh_key._.id}"]
}

data "digitalocean_domain" "_" {
  name = "${var.domain}"
}

resource "digitalocean_record" "_" {
  domain = "${data.digitalocean_domain._.name}"
  name   = "${var.subdomain}"
  type   = "A"
  ttl    = 300
  value  = "${digitalocean_droplet._.ipv4_address}"
}
