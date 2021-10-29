data "aws_ami" "ubuntuwp" {
  most_recent      = true
  name_regex       = "^ubuntuwp"
  owners           = ["757055078616"]

  filter {
    name   = "name"
    values = ["ubuntuwp"]
  }
}

data "aws_ami" "ubuntusql" {
  most_recent      = true
  name_regex       = "^ubuntusql"
  owners           = ["757055078616"]

  filter {
    name   = "name"
    values = ["ubuntusql"]
  }
}