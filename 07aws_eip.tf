resource "aws_eip" "tfeip"  {
	vpc  = true
	tags = {
		Name = "Tf-eip"
	}
	depends_on = [
		aws_route_table_association.assoc1
	]
}