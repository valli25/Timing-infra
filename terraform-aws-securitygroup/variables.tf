variable "security_group_name" {
  type = string
  default = "timing-sg"
}
variable "security_group_description" {
  type = string
  default = "this is timing project sg group"
}
variable "vpc_id" { 
    type = string
  default = "192.168.0.0/16"
}

variable "security_group_tags" {
  type = map 
  default = {}
}
variable "ingress" {
  default = {
    postgress = {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        description = "allow 5432 port numbers"
        cidr_blocks = ["0.0.0.0/0"]
    },
  
    http = {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        description = "allow 80 port numbers"
        cidr_blocks = ["0.0.0.0/0"]
  },
  https = {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    description = "allow port 443 from internet"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
}