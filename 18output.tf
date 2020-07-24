resource "null_resource" "runwebpage"  {
	provisioner "local-exec" {
		command = "start msedge ${aws_instance.tfwordpress.public_ip}"
	}
	depends_on = [
		null_resource.ip_update
	]
}