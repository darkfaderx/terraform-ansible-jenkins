resource "tls_private_key" "cert" {
  algorithm = "RSA"
}

resource "acme_registration" "_" {
  account_key_pem = "${tls_private_key.cert.private_key_pem}"
  email_address   = "${var.email_address}"
}

resource "acme_certificate" "_" {
  account_key_pem = "${acme_registration._.account_key_pem}"
  common_name     = "${digitalocean_record._.fqdn}"

  dns_challenge = {
    provider = "digitalocean"

    config {
      DO_AUTH_TOKEN = "${var.do_token}"
    }
  }
}

resource "local_file" "cert_pem" {
  content  = "${acme_certificate._.certificate_pem}"
  filename = "${path.module}/../conf/certs/certificate.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private.filename}"
  }
}

resource "local_file" "iss_pem" {
  content  = "${acme_certificate._.issuer_pem}"
  filename = "${path.module}/../conf/certs/issuer.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private.filename}"
  }
}

resource "local_file" "private_pem" {
  content  = "${acme_certificate._.private_key_pem}"
  filename = "${path.module}/../conf/certs/private.pem"

  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private.filename}"
  }
}
