data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "ami_id"{
  most_recent = true  
  owners = ["amazon"]
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
   state = "available"
   filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}