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
default_vpc_id             = "vpc-0311b33936523a908"
default_vpc_cidr           = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-07795e89ee4781179"

env = "dev"

tags = {
  company_name  = "ABC Tech"
  business_unit = "E.Com"
  project_name  = "roboshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}


