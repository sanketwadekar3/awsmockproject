resource "aws_internet_gateway" "default" {
    vpc_id = var.vpc_id
        tags = { 
        Name = var.tag_name
    }
}

output "igw_id" {
  value = aws_internet_gateway.default.id
}
