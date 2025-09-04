####VPC module
This is going to create following resources
* vpc
* Internet Gateway
#### Arguments
**vpc_cidr** (optional) - Default value is 10.0.0.0/16
**vpc_tags (optionla)   - 
**public_subnet_cidr** (required) - user must provide 2 valid subnet cidr
**public_subnet_names**  (required) - user must provide 2 valid subnet names
**public_route_table** (optional) - user can provide tags,other wise empty