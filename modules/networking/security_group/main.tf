resource "aws_security_group" "my_sg"  {
    name = var.sg_name
    description = var.description
    vpc_id = var.vpc_id

    dynamic "ingress" {
        for_each = var.ingress
        content {
            from_port = ingress.value.from_port
            to_port = ingress.value.to_port
            protocol = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }

    dynamic "egress" { 
        for_each = var.egress
        content {
            from_port = egress.value.from_port
            to_port = egress.value.to_port
            protocol = egress.value.protocol
            cidr_blocks = egress.value.cidr_blocks
        }
    }

}

output "sg_id" {
  value = aws_security_group.my_sg.id
}
