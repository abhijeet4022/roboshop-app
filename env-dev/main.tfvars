default_vpc_id             = "vpc-0311b33936523a908"
default_vpc_cidr           = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-07795e89ee4781179"
ssh_sg_ingress_cidr        = ["172.31.38.193/32"]
env                        = "dev"
tags                       = {
  company_name  = "ABC Tech"
  business_unit = "E.Com"
  project_name  = "roboshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}


# VPC Details
vpc = {

  main = {
    cidr    = "10.0.0.0/17"
    subnets = {
      public = {
        public-subnet-1a = { cidr = "10.0.0.0/24", az = "us-east-1a" }
        public-subnet-2b = { cidr = "10.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app-subnet-1a = { cidr = "10.0.2.0/24", az = "us-east-1a" }
        app-subnet-2b = { cidr = "10.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db-subnet-1a = { cidr = "10.0.4.0/24", az = "us-east-1a" }
        db-subnet-2b = { cidr = "10.0.5.0/24", az = "us-east-1b" }
      }
    }
  }

}


# Alb Details.
alb = {
  public = {
    internal        = false
    lb_type         = "application"
    sg_port         = "80"
    sg_ingress_cidr = ["0.0.0.0/0"]

  }
  private = {
    internal        = true
    lb_type         = "application"
    sg_port         = "80"
    sg_ingress_cidr = ["172.31.0.0/16", "10.0.0.0/17"]
  }
}


# DocumentDB details.
docdb = {
  main = {
    backup_retention_period = "5"
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version          = "4.0.0"
    engine_family           = "docdb4.0"
    instance_count          = "1"
    instance_class          = "db.t3.medium"   #Free trial eligible
  }
}

rds = {
  main = {
    rds_type                = "mysql"
    port                    = "3306"
    parameter_group_family  = "aurora-mysql5.7"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.4"
    backup_retention_period = "5"
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    instance_class          = "db.t3.small"
    instance_count          = "1"
  }
}

elasticache = {
  main = {
    elasticache_type       = "redis"
    port                   = "6379"
    parameter_group_family = "redis6.x"
    engine                 = "redis"
    engine_version         = "6.2"
    node_type              = "cache.t3.micro"
    num_cache_nodes        = "1"
  }
}

rabbitmq = {
  main = {
    instance_type = "t2.micro"
  }
}




