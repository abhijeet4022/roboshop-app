module "vpc" {
  source = "git::https://github.com/abhijeet4022/tf-module-vpc.git"

  for_each                   = var.vpc
  cidr                       = each.value["cidr"]
  subnets                    = each.value["subnets"]
  tags                       = each.key
  default_vpc_id             = var.default_vpc_id
  default_vpc_cidr           = var.default_vpc_cidr
  default_vpc_route_table_id = var.default_vpc_route_table_id
}

output "vpc" {
  value = module.vpc
}
