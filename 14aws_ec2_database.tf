resource "aws_instance" "tfmysql" {
	ami           = "ami-0b1cf2d31713ad4cd"
	instance_type = "t2.micro"
	key_name 	  = aws_key_pair.deployer.key_name
	subnet_id 	  = aws_subnet.tfprivatesubnet.id
	
	vpc_security_group_ids = [
		aws_security_group.tfdbSG.id
	]
	
	tags = {
		Name = "MySQL"
	}
	
	depends_on = [
		aws_key_pair.deployer
	]
}