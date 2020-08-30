resource "aws_subnet" "my_subnet" {
  for_each      = var.params

  vpc_id = each.value.vpc_id
  cidr_block  = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.tag_name
  }
}

output "subnet" {
  value = {for subnet in aws_subnet.my_subnet: subnet.tags["Name"]=>subnet.id}
}
