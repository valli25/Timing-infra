# module "rds_security_group" {
#   source = "git::https://github.com/valli25/Timing-infra.git?ref=v0.0.2"
#   security_group_name = "{var.project_name}-rds"
#   security_group_description = "this is to attach for RDS instance"
#   vpc_id = local.vpc_id
#   security_group_tags = merge(var.common_tags,
#       {

#       Name = "${var.project_name}-rds"
#       }
#       )
# }

# module "alb_security_group" {
#   source = "git::https://github.com/valli25/Timing-infra.git?ref=v0.0.2"
#   security_group_name = "{var.project_name}-alb"
#   security_group_description = "this is to attach for alb instance"
#   vpc_id = local.vpc_id
#   security_group_tags = merge(var.common_tags,
#       {

#       Name = "${var.project_name}-alb"
#       }
#       ) 
#  ingress = var.alb_ingress
# }

# http_tcp_listeners = [
# {
#     port = 80
#     protocol = "HTTP"
#     target_group_index = 0
# }
# ]
# http_listner_rules = [
#     {
#         http_listner_index = 0
#         priority = 5000
#         actions = [{
#             type = "redirect"
#             status_code = "HTTP_302"
#             host = "www.youtube.com"
#             path = "/watch"
#             query = "v=dqw4wgxcq"
#             protocol = "HTTPS"
#         }]
#         condition = [{
#             path_patterns = ["/onboarding", "/docs"]
#         }]
#     }
# ]

