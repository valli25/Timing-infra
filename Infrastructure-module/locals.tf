locals {
    vpc_id = module.this.vpc_id.id
    rds_security_group_id = module.rds_security_group.rds_security_group_id
    db_subnet_group_name = module.this.db_subnet_group_name
}

output "vpc_id" {
  value = local.vpc_id
}

output "rds_Security_group_id" {
   value = locals.rds_Security_group_id 
}