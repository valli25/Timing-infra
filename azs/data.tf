data "aws_availability_zones" "azs_info" {}


locals {
  instance_tenancy = "default"
  azs_count = 2
  all_azs = data.aws_availability_zones.azs_info.names
  azs = slice(local.all_azs, 0, local.azs_count)
  #split_values = split("-" , local.azs[0] )
  #last_element = element(local.split_values, length(local.split_values)-1)

  az_labels = [element(split("-" , local.azs[0]), length(split("-",local.azs[0]))-1),
               element(split("-",local.azs[1]), length(split("-",local.azs[0]))-1)
  ]
}

output "azs_labels" {
    value = local.az_labels
}
# output "azs_names" {
#   value = data.aws_availability_zones.azs_info.names
# }

# output "azs" {
#   value = local.azs
# }
# output "split_list" {
#   value = local.split_values
# }

# output "last_element" {
# value = local.last_element  
# }