resource "aws_security_group" "tfwpSG" {
	name        = "WordpressSG"
	description = "Allows TCP,ICMP-IPv4,HTTP,SSH to the wordpress EC2 instance"
	vpc_id      = aws_vpc.tfvpc.id

	ingress {
		description = "HTTP from VPC"
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "ICMP from VPC"
		from_port   = -1
		to_port     = -1
		protocol    = "icmp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "SSH from VPC"
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "HTTPS from VPC"
		from_port   = 443
		to_port     = 443
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
		Name = "Tf-WordpressSG"
	}

	depends_on = [
		aws_route_table_association.tfassoc2
	]
}
