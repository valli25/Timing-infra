module "rds" {
   source = "git::https://github.com/valli25/Timing-infra.git?ref=v0.0.2"
   tags = var.common_tags
   allocated_storage = var.allocated_storage
   db_name = var.db_name  
   engine = var.engine
   instance_class = var.instance_class
   rds_username = var.rds_username
   rds_security_group_id = local.rds_Security_group_id
   db_subnet_group_name = local.db_subnet_group_name
   rds_password_arn = var.rds_password_arn
}