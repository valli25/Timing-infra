variable "allocated_storage" {
  type = number
}

variable "db_name" {
  type = string 

}
variable "engine" {
  type = string
}
variable "instance_class" {
  type = string
}

variable "rds_username" {
  type = string
}

variable "rds_Security_group_id" {
  type = list
}

variable "db_subnet_group_name" {
  type = string 
}

variable "rds_password_arn" {
  type = string 

}

variable "tags" {
  type = map 
  default = {}
}