module "rds_security_group" {
  source = "git::https://github.com/valli25/Timing-infra.git?ref=v0.0.2"
  security_group_name = var.rds_security_group_name 
  security_group_description = var.rds_security_group_description
  vpc_id = local.vpc_id
  tags = var.tags
}