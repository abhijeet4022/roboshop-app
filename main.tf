module "vpc" {
  source = "git::https://github.com/abhijeet4022/tf-module-vpc.git"

  for_each = var.vpc
  cidr = each.value["cidr"]
  tags = each.key




}
