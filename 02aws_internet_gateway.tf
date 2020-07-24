# Creating Internet Gateway
resource "aws_internet_gateway" "tfgateway" {
	vpc_id = aws_vpc.tfvpc.id

	tags = {
		Name = "Tf-igw"
		description = "Allows connection to VPC and EC2 instance present in public subnet."
	}

	depends_on = [
		aws_vpc.tfvpc
	]
}
