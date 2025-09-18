resource "aws_key_pair" "provisioner" {
  key_name = "provisioner" 
  public_key = file("C:\\Users\\pravs\\Downloads\\provisioner.pub")
}
 resource "aws_security_group" "provisioner-sg" {
   name = "provisionersg"
   description = "allow all ports"
   vpc_id = "vpc-0cb35cf0b62bfa778"

   ingress {
    description = "tls from vpc"
    from_port = "0"
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
    Name = "provisioner-sg"
   }
 }



# resource "aws_instance" "ec2" {
#    ami =  "ami-00ca32bbc84273381"
#   instance_type = "t3.micro"
#   key_name = aws_key_pair.provisioner.key_name
#   security_groups = [aws_security_group.provisioner-sg.name]

#   provisioner "local-exec" {
#     command = "echo the server ip addresss is ${self.public_ip} > public_ip.txt"
#   }

# }

resource "aws_instance" "remote" {

  ami =  "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  root_block_device {
    volume_size = 20
  }
  key_name = aws_key_pair.provisioner.key_name
  security_groups = [aws_security_group.provisioner-sg.name]
  tags = {
    
    name = "docker-server"
  }

  connection  {

    type = "ssh"
    user = "ec2-user"
    private_key = file("C:\\Users\\pravs\\Downloads\\provisioner.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo yum install git -y"
    ]
  }

provisioner "local-exec" {
    command = "echo the server ip addresss is ${self.public_ip} > public_ip.txt"
  }

}