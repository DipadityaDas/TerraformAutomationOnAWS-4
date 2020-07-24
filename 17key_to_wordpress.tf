resource "null_resource" "key_update" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.tfkey.private_key_pem
    host        = aws_instance.tfwordpress.public_ip
  }

  provisioner "file" {
    source = "./Tfkey.pem"
	destination = "/home/ec2-user/"
  }

  depends_on = [
    null_resource.ip_update
  ]
}
