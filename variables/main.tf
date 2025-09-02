resource "aws_vpc" "main" {
 cidr_block = var.cidr_block
 instance_tenancy = var.instance_tenancy
 enable_dns_support = var.dns_support
 enable_dns_hostnames = var.dns_hostnames

 tags = var.tags
    
 }

 #security groups for postgress RDS , 5432

resource "aws_security_group" "allow_postgress" {
  name = "allow_postgress"
  description = "allow postgress inbound traffic"
  vpc_id = aws_vpc.main.id

  ingress {
    description  = "TLS from vpc"
    from_port = var.postgress_port
    to_port   = var.postgress_port
    protocol = "tcp"
    cidr_blocks = var.cidr_list
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

/* resource "aws_instance" "ec2-instance" {
  count =3
  ami = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  } 
}
 */
/* resource "aws_instance" "condition" {
  ami = "ami-00ca32bbc84273381"
  instance_type = var.isprod ? "t3.large " : "t2.micro"
}

resource "aws_instance" "condition" {
 ami = "ami-00ca32bbc84273381"
 instance_type = var.env == "PROD" ? "t3.large" : "t2.micro"

} */

resource "aws_key_pair" "yeskey" {
  key_name = "yes"
  public_key = file("C:\\Users\\pravs\\yes.pub")
}

resource "aws_instance" "condition" {
  key_name = aws_key_pair.yeskey.key_name
 ami = "ami-00ca32bbc84273381"
 instance_type = var.env == "PROD" ? "t3.large" : "t2.micro"
}