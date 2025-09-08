resource "aws_instance" "ec2" {
   ami =  "ami-00ca32bbc84273381"
  instance_type = lookup(var.instance_type, terraform.workspace)


}