resource "aws_route_table" "rt_pub" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt_public"
  }
}

resource "aws_route_table_association" "rta_pub" {
  subnet_id      = aws_subnet.sub-pub.id
  route_table_id = aws_route_table.rt_pub.id
}


resource "aws_route_table" "rt_pvt" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "rt_pvt"
  }
}

resource "aws_route_table_association" "rta_pvt" {
  subnet_id      = aws_subnet.sub-pvt.id
  route_table_id = aws_route_table.rt_pvt.id
}