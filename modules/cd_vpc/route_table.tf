resource "aws_route_table" "cd_publicrt" {
  vpc_id  = aws_vpc.cd_vpc.id
  tags = {
    Name = "cd_public_rt"
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id              = aws_route_table.cd_publicrt.id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id                  = aws_internet_gateway.cd_igw.id
}
resource "aws_route_table_association" "rt_public_subnet" {
  count           = length(var.public_subnets_cidr) 
  subnet_id       = element(aws_subnet.cd_public_subnet[*].id, count.index)
  route_table_id  = aws_route_table.cd_publicrt.id
}

resource "aws_route_table" "cd_privatert" {
  vpc_id    = aws_vpc.cd_vpc.id
  tags = {
    Name = "cd_private_rt"
  }
}
resource "aws_route" "private_natgateway" {
  route_table_id              = aws_route_table.cd_privatert.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.cd_ngw[0].id
}
resource "aws_route_table_association" "rt_associate_private" {
  count           = length(var.private_subnets_cidr) 
  subnet_id       = element(aws_subnet.cd_private_subnet[*].id, count.index)
  route_table_id  = aws_route_table.cd_privatert.id
}