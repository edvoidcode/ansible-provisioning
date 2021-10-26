resource "aws_vpc" "lab-vpc" {
   cidr_block = var.cidr_block
   instance_tenancy = "default"
   
   tags = {
      Name = "lab-vpc"
      Owner = "edson"
   }
}

resource "aws_subnet" "sub-pub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.sub1-cidr

  tags = {
    Name = "sub-pub"
  }
}

resource "aws_subnet" "sub-pvt" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.sub2-cidr

  tags = {
    Name = "sub-pvt"
  }
}