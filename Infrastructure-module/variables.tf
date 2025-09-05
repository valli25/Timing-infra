variable "project_name" {
  default = "timing"

}
 variable "vpc_cidr" {
   default = "10.0.0.0/16"
 }

 variable "common_tags" {
   type = map 
   default = {
    Name = "timing"
    Terraform = "true"
    Environment = "DEV"
   }
 }

variable "public_subnet_cidr" {
default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "private_subnet_cidr" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "database_subnet_cidr" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
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

variable "allocated_storage" {
  type = number
  default = 20
}

variable "db_name" {
  type = string 
  default = "timing"

}
variable "engine" {
  type = string
  default = "postgress"
}
variable "instance_class" {
  type = string
  default = "db.t4g.micro"
}

variable "rds_username" {
  type = string
  default = "timingadmin"
}

variable "rds_password_arn" {
  default = "arn:aws:secretsmanager:us-east-1:951280367986:secret:timing/rds/pass-b3r7VZ"
}
variable "rds_security_group_name" {
  default = "timing"
}

variable "rds_security_group_description" {
  default = "This security group is to attach timing RDS"
}

variable "security_group_name" {
  type = string
  default = "timing"
}
variable "security_group_description" {
  type = string
  default = "this is timing sg group"
}