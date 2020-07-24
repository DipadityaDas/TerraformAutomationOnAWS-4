resource "aws_route_table_association" "assoc1" {
	subnet_id      = aws_subnet.tfpublicsubnet.id
	route_table_id = aws_route_table.tfroute1.id
	depends_on = [
		aws_route_table.tfroute1
	]
}