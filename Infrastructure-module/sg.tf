module "rds_security_group" {
  source = "../terraform-aws-securitygroup"
  security_group_name = var.rds_security_group_name
  security_group_description = var.rds_security_group_description
  vpc_id = local.vpc_id
  tags = var.tags
     

}