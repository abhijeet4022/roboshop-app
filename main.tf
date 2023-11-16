# Configure the VPC.
module "vpc" {
  source = "git::https://github.com/abhijeet4022/tf-module-vpc.git"
  env    = var.env
  tags   = var.tags

  for_each                   = var.vpc
  cidr                       = each.value["cidr"]
  subnets                    = each.value["subnets"]
  default_vpc_id             = var.default_vpc_id
  default_vpc_cidr           = var.default_vpc_cidr
  default_vpc_route_table_id = var.default_vpc_route_table_id

}


# Configure the Application Load Balancer.
module "alb" {
  source = "git::https://github.com/abhijeet4022/tf-module-alb.git"
  env    = var.env
  tags   = var.tags

  for_each        = var.alb
  internal        = each.value["internal"]
  lb_type         = each.value["lb_type"]
  vpc_id          = each.value["internal"] ? local.vpc_id : var.default_vpc_id
  sg_port         = each.value["sg_port"]
  sg_ingress_cidr = each.value["sg_ingress_cidr"]
  subnets         = each.value["internal"] ? local.app_subnets : data.aws_subnets.subnets.ids
}


# Configure the DocumentDB/Mongodb.
module "docdb" {
  source = "git::https://github.com/abhijeet4022/tf-module-docdb.git"
  env    = var.env
  tags   = var.tags

  for_each                = var.docdb
  subnet_ids              = local.db_subnets
  backup_retention_period = each.value["backup_retention_period"]
  preferred_backup_window = each.value["preferred_backup_window"]
  skip_final_snapshot     = each.value["skip_final_snapshot"]
  vpc_id                  = local.vpc_id
  docdb_sg_ingress_cidr   = local.app_subnets_cidr
  engine_version          = each.value["engine_version"]

}





