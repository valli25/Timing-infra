module "aws_security_group" {
  source = "git::https://github.com/valli25/Timing-infra.git?ref=v0.0.2"
  security_group_name = var.security_group_name 
  security_group_description = var.security_group_description
  vpc_id = local.vpc_id
  tags = var.common_tags
}