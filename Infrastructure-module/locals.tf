locals {
    vpc_id = module.this.vpc_id
}

output "vpc_id" {
  value = local.vpc_id
}