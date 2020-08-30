resource "aws_nat_gateway" "gw" {
  allocation_id = var.allocation_id
  subnet_id  = var.subnet_id
  tags = {
    Name = "var.tag_name"
  }
}

output "nat_gw_id" {
    value = aws_nat_gateway.gw.id
}