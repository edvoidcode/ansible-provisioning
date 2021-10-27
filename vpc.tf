resource "aws_vpc" "lab-vpc" {
   cidr_block = var.cidr_block
   instance_tenancy = "default"
   
   tags = {
      Name = "lab-vpc"
      Owner = "edson"
   }
}

resource "aws_subnet" "sub-pub" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = var.sub1-cidr

  tags = {
    Name = "sub-pub"
  }
}

resource "aws_subnet" "sub-pvt" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = var.sub2-cidr

  tags = {
    Name = "sub-pvt"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_eip" "el_ip" {
  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.el_ip.id
  subnet_id     = aws_subnet.sub-pub.id

  tags = {
    Name = "natgw"
  }

  depends_on = [aws_internet_gateway.igw]
}