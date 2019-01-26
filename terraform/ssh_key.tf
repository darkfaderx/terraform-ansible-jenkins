resource "tls_private_key" "_" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private" {
  content  = "${tls_private_key._.private_key_pem}"
  filename = "${path.module}/jenkins.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private.filename}"
  }
}

resource "local_file" "public" {
  content  = "${tls_private_key._.public_key_pem}"
  filename = "${path.module}/jenkins.pub"
}

resource "digitalocean_ssh_key" "_" {
  name       = "Jenkins SSH"
  public_key = "${tls_private_key._.public_key_openssh}"
}
