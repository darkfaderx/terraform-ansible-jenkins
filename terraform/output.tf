output "ip_address" {
  value = "${digitalocean_droplet._.ipv4_address}"
}

output "private_key" {
  value = "${local_file.private.filename}"
}

output "jenkins_url" {
  value = "${digitalocean_record._.fqdn}"
}

output "ansible" {
  sensitive = true
  value     = "ansible-playbook -u root --private-key ${local_file.private.filename} -i ${digitalocean_droplet._.ipv4_address}, --extra-vars domain_name=${digitalocean_record._.fqdn} --extra-vars jenkins_admin_password=${var.admin_password} --extra-vars host_key_checking=False ansible/jenkins.yaml"
}

output "job_sync" {
  sensitive = true
  value     = "ansible-playbook -u root --private-key ${local_file.private.filename} -i ${digitalocean_droplet._.ipv4_address}, --extra-vars host_key_checking=False ansible/job_sync.yaml"
}

output "ssh" {
  value = "ssh root@${digitalocean_droplet._.ipv4_address} -i ${local_file.private.filename} -o StrictHostKeyChecking=no"
}
