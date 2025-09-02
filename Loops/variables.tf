variable "public_subnet_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "azs" {
  type = list
  default = ["us-east-1a","us-east-1b"]
}

variable "public_subnet_names" {
  type = list
  default = ["public-1a","public-1b"]
  
}

variable "project_name" {
  type = string
  default = "timing-2"
  description = "this is the project name"
}

variable "private_subnets" {
  type = map 
  default =   {
    private-subnet-1 = {
        Name = "private-1a"
        cidr = "10.0.11.0/24"
        az = "us-east-1a"
  }
  
  private-subnet-2 = {
        Name = "private-1b"
        cidr = "10.0.12.0/24"
        az = "us-east-1b"
  }
}
}
variable "vpc_cidr" {
  type = string
}