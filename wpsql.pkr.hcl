packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntuwp" {
   ami_name      = "ubuntuwp"
   instance_type = "t2.micro"
   region        = "eu-west-1"
   source_ami    = "ami-0a8e758f5e873d1c1"
   ssh_username  = "ubuntu"
   
   tags = {
      Owner  = "Edson Silva"
      Name   = "ubuntuwp"
   }
}

build {
   name = "ubuntuwp"
   sources = [
   "source.amazon-ebs.ubuntuwp"
  ]

   provisioner "shell" {
   inline = [
      "sudo apt-get update -y && sudo apt-get upgrade -y",
      "sudo apt install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible -y"
      ]
  }
}

source "amazon-ebs" "ubuntusql" {
   ami_name      = "ubuntusql"
   instance_type = "t2.micro"
   region        = "eu-west-1"
   source_ami    = "ami-0a8e758f5e873d1c1"
   ssh_username  = "ubuntu"
   
   tags = {
      Owner  = "Edson Silva"
      Name   = "ubuntusql"
   }
}

build {
   name = "ubuntusql"
   sources = [
   "source.amazon-ebs.ubuntusql"
  ]

   provisioner "shell" {
   inline = [
      "sudo apt-get update -y && sudo apt-get upgrade -y",
      "sudo apt install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible -y"
      ]
  }
}