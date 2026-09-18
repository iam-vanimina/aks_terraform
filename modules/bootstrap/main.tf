resource "terraform_data" "roboshop_bootstrap" {

  triggers_replace = [
    var.vm_id
  ]

  connection {
    type     = "ssh"
    user     = var.admin_username
    password = var.admin_password
    host     = var.vm_ip
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/bootstrap-hosts.sh"
  }
}