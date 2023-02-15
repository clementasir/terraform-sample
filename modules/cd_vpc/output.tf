output "public_subnets" {
  value = aws_subnet.cd_public_subnet[*].id
}

output "private_subnets" {
  value = aws_subnet.cd_private_subnet[*].id
}