variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

# is not mandatory
variable "vpc_tags" {
  type = map 
  default = {}
  }

  variable "igw_tags" {
    type = map 
    default = {}
  }

  variable "public_subnet_cidr" {
    type = list
    description = "please provide 2 public subet cidr"
    validation {
      condition = (
        length(var.public_subnet_cidr) == 2
      )
      error_message = "CIDR list must be 2"
    }
  }

  variable "public_subnet_names" {
    type = list 
    description = "please provide 2 public subet names"
    #default = []
    validation {
      condition = (
        length(var.public_subnet_names) == 2
      )
      error_message = "Names list must be 2"
    }
  }

  variable "private_subnet_cidr" {
    type = list
    description = "please provide 2 private subet cidr"
    validation {
      condition = (
        length(var.private_subnet_cidr) == 2
      )
      error_message = "CIDR list must be 2"
    }
  }

  variable "private_subnet_names" {
    type = list 
    description = "please provide 2 privatesubet names"
    #default = []
    validation {
      condition = (
        length(var.private_subnet_names) == 2
      )
      error_message = "Names list must be 2"
    }
  }

  
  
  variable "public_route_table_tags" {
    type = map 
    default = {}
  }
  
  variable "private_route_table_tags" {
    type = map 
    default = {}
  }