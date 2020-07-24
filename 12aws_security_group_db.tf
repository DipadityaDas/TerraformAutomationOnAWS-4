resource "aws_security_group" "tfdbSG" {
	name        = "mariadbSG"
	description = "Allow mysql and all outbound traffic to Database EC2 Instance."
	vpc_id      = aws_vpc.tfvpc.id

	ingress {
		description = "TLS from VPC"
		from_port   = 3306
		to_port     = 3306
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "SSH from public subnet"
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Tf-mariadbSG"
	}
	
	depends_on = [
		aws_security_group.tfwpSG
	]
}

