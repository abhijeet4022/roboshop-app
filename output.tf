output "vpc" {
  value = module.vpc
}

#output "subnets" {
#  value = data.aws_subnets.subnets.ids
#}

#output "alb" {
#  value = module.alb
#}

output "listener" {
  value = lookup(lookup(lookup(module.alb, "private", null), "listener", null), "arn", null)
}