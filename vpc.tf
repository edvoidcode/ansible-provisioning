resource "aws_vpc" "lab-vpc" {
   cidr_block = var.cidr_block
   instance_tenancy = "default"
   
   tags = {
      Name = "lab-vpc"
      Owner = "edson"
   }
}