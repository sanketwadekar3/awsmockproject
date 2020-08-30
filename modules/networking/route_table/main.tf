resource "aws_route_table" "my_rtable" {
    vpc_id = var.vpc_id
    route {
    cidr_block =var.cidr_block
    gateway_id =var.gateway_id
    }
    tags = {
        Name = var.tag_name
    }
        
}

output "rt_id" {
  value = aws_route_table.my_rtable.id
}
 