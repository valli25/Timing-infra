module "rds" {
  allocated_storage = var.allocated_storage
  db_name = var.db_name
  engine = var.engine
  instance_class = var.instance_class
  username = var.rds_username
  rds_security_group_ids = [local.rds_Security_group_id]
}