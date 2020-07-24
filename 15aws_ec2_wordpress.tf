resource "aws_instance" "tfwordpress" {
	ami           = "ami-0686489178e6fc922"
	instance_type = "t2.micro"
	key_name 	  = aws_key_pair.deployer.key_name
	subnet_id 	  = aws_subnet.tfpublicsubnet.id
	
	vpc_security_group_ids = [
		aws_security_group.tfwpSG.id
	]
	
	tags = {
		Name = "Wordpress"
	}
	
	depends_on = [
		aws_instance.tfsql
	]
}