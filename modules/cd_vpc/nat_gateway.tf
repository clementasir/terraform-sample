resource "aws_eip" "cd_external_ip" {
  vpc = true
  tags = {
    Name = "cd_external_nat_ip"
  }
}

resource "aws_nat_gateway" "cd_ngw" {
    count         = 1
    allocation_id = element(aws_eip.cd_external_ip[*].id, count.index)
    subnet_id     = element(aws_subnet.cd_public_subnet[*].id, count.index)
    tags = {
        Name = "cd_ngw"
    }
  depends_on = [aws_internet_gateway.cd_igw]
}