resource "aws_vpc" "main" {
  cidr_block  = var.vpc_cidr
  tags = {
    Name = var.tag_name_vpc
  }
}


output "vpc_id" {
  value = aws_vpc.main.id
}


