resource "aws_db_subnet_group" "my_sub_group" {
    name = var.name
    subnet_ids = var.subnet_ids 
        tags = { 
        Name = var.tag_name
    }
}

output "subnet_group_name" {
    value = aws_db_subnet_group.my_sub_group.id
}