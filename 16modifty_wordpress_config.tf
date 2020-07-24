resource "null_resource" "ip_update" {
  //To connect to instance
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.tfkey.private_key_pem
    host        = aws_instance.tfwordpress.public_ip
  }

  // To update new ip
  provisioner "remote-exec" {
    inline = [
      "sudo sed -i 's/172.31.44.165/${aws_instance.tfmysql.private_ip}/g' /var/www/html/wp-config.php",
    ]
  }

  depends_on = [
    aws_instance.tfwordpress
  ]
}
