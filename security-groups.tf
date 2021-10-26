resource "aws_security_group" "sg-rules-wp" {
  name        = "sg-rules-wp"
  description = "Allow traffic ssh and http"
  vpc_id      = aws_vpc.lab-vpc.id

  ingress {
      description      = "SSH traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
   }

  ingress {
      description      = "SSH traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
   }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
   }

  tags {
    Name = "sg-rules-wp"
  }
}

resource "aws_security_group" "sg-rules-sql" {
  name        = "sg-rules-sql"
  description = "Allow traffic ssh and SQL"
  vpc_id      = aws_vpc.lab-vpc.id

  ingress {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description      = "SSH traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  

  tags{
      Name = "sg-rules-sql"
  }
  
}