resource "aws_route_table_association" "my_rt_assoc" {
    subnet_id = var.subnet_id
    route_table_id = var.route_table_id

}

output "rt_assoc_id" {
  value =aws_route_table_association.my_rt_assoc.id
}

