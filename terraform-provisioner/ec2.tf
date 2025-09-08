resource "aws_key_pair" "provisioner" {
  key_name = "provisioner" 
  public_key = file("C:\\Users\\pravs\\Documents\\Timinginfraproject\\Timing-infra\\terraform-workspace\\provisioner.pub")
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



resource "aws_instance" "ec2" {
   ami =  "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  key_name = aws_key_pair.provisioner.key_name

  provisioner "local-exec" {
    command = "echo the server ip addresss is ${self.public_ip} > public_ip.txt"
  }

}

resource "aws_instance" "remote" {

  ami =  "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  key_name = aws_key_pair.provisioner.key_name
  security_groups = [aws_security_group.provisioner-sg.name]

  connection  {

    type = "ssh"
    user = "ec2-user"
    private_key = file("C:\\Users\\pravs\\Documents\\Timinginfraproject\\Timing-infra\\terraform-workspace\\provisioner.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "touch /tmp/remote.txt",
      "echo 'this file is created by remote provisioner' > /tmp/remote.txt"
    ]
  }


}