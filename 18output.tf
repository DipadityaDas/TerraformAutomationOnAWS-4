resource "null_resource" "runwebpage"  {
	provisioner "local-exec" {
		command = "start msedge ${aws_instance.tfwordpress.public_ip}"
	}
	depends_on = [
		null_resource.ip_update
	]
}

output "Wordpress_public_ip" {
	value = aws_instance.tfwordpress.public_ip
}