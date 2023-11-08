vpc = {

  main = {
    cidr = "10.0.0.0/17"
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


