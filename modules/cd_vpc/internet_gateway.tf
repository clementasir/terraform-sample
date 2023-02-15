resource "aws_internet_gateway" "cd_igw" {
  vpc_id = aws_vpc.cd_vpc.id
  tags = {
    Name = "cd_igw-"
  }
}
