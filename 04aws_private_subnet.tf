resource "aws_subnet" "tfprivatesubnet" {
	vpc_id     = aws_vpc.tfvpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "ap-south-1b"
  
	tags = {
		Name = "Tf-private-subnet"
	}
	depends_on = [
		aws_subnet.tfpublicsubnet
	]
}