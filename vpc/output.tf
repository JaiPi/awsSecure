output "vpc_main_id" {
  value = aws_vpc.main.id
}

output "subnet_public-1_id" {
    value = aws_subnet.main-public-1.id
}