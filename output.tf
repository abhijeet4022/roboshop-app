output "vpc" {
  value = module.vpc
}

output "subnets" {
  value = data.aws_subnets.subnets.ids
}

output "local------------------------------------------------------------" {
  value = local.app_subnets
}



#output "alb" {
#  value = module.alb
#}