module "alb" {
  source = "terraform-aws-modules/alb/aws"
  name = "${var.project_name}"
  load_balancer_type = "application"
  vpc_id = local.vpc_id
  subnets = local.public_subnet_ids
  security_groups = local.alb_security_group_id
  
}