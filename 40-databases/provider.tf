terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
  # state.config
  backend "s3" {
    bucket       = "vinodh-remote-state-dev"
    key          = "roboshop-dev-db"
    region       = "us-east-1"
    encrypt      = true # if someone access to aws key will be encrypted format. so cant able to 
    use_lockfile = true
  }

}

provider "aws" {
  region = "us-east-1" # provide any region 
}