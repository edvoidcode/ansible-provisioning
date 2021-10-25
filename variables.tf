variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "ami-id" {
  type        = string
  default     = "ami-0a8e758f5e873d1c1"
  description = "AWS Image Ubuntu Server 20.04 LTS (HVM)"
}