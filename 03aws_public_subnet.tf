// Creating a public subnet
resource "aws_subnet" "tfpublicsubnet" {
	vpc_id     				= aws_vpc.tfvpc.id
	cidr_block 				= "10.0.0.0/24"
	map_public_ip_on_launch = "true"
	availability_zone 		= "ap-south-1a"

	tags = {
		Name = "Tf-public-subnet"
	}
	depends_on = [
		aws_vpc.tfvpc,
		aws_internet_gateway.tfgateway
	]
}

