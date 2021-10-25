<<<<<<< HEAD
=======
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


>>>>>>> 23b616ca9b5ef3f5aa356ab82ce2740348866f1a
resource "aws_vpc" "lab-vpc" {
   cidr_block = var.cidr_block
   instance_tenancy = "default"
   
   tags = {
      Name = "lab-vpc"
      Owner = "edson"
   }
<<<<<<< HEAD
=======
}

resource "aws_subnet" "sub-pb"{
   vpc_id = aws_vpc.lab-vpc.id 

>>>>>>> 23b616ca9b5ef3f5aa356ab82ce2740348866f1a
}