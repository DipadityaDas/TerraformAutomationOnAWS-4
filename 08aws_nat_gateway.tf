resource "aws_nat_gateway" "tfnat" {
	allocation_id = aws_eip.tfeip.id
	subnet_id     = aws_subnet.tfpublicsubnet.id
	
	tags = {
		Name = "Tf-NAT"
	}
	
	depends_on = [
		aws_eip.tfeip
	]
}