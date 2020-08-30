resource "aws_eip" "nat"{
  vpc= var.vpc
  instance = var.instance 
  depends_on = [var.dependency] 
}

output "nat_id" {
    value = aws_eip.nat.id
}