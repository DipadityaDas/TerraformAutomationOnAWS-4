resource "aws_route_table_association" "tfassoc2" {
	subnet_id      = aws_subnet.tfprivatesubnet.id
	route_table_id = aws_route_table.tfroute2.id
	
	depends_on = [
		aws_route_table.tfroute2
	]
}