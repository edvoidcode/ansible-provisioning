terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
   region = var.region
}

terraform {
  backend "s3" {
    bucket = "newbucket-tf"
    key    = "test/tf2.state"
    region = "eu-west-1"
  }
}



