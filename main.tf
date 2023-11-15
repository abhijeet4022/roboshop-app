module "vpc" {
  source = "git::https://github.com/abhijeet4022/tf-module-vpc.git"

  for_each                   = var.vpc
  cidr                       = each.value["cidr"]
  subnets                    = each.value["subnets"]
  default_vpc_id             = var.default_vpc_id
  default_vpc_cidr           = var.default_vpc_cidr
  default_vpc_route_table_id = var.default_vpc_route_table_id
  env                        = var.env
  tags                       = var.tags
}


module "alb" {
  source = "git::https://github.com/abhijeet4022/tf-module-alb.git"

  for_each        = var.alb
  internal        = each.value["internal"]
  lb_type         = each.value["lb_type"]
  env             = var.env
  tags            = var.tags
  vpc_id          = each.value["internal"] ? local.vpc_id : var.default_vpc_id
  sg_port         = each.value["sg_port"]
  sg_ingress_cidr = each.value["sg_ingress_cidr"]
  subnets         = each.value["internal"] ? local.app_subnets : data.aws_subnets.subnets.ids
}


output "vpc" {
  value = module.vpc
}
