output "aws_instance" {
  value = aws_instance.cd_instance.*.private_ip
}