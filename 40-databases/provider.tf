terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
    backend "s3" {
    bucket = "myown-remote-state" 
    key = "roboshop_dev_databases"
    encrypt = true
    region = "us-east-1"
    use_lockfile = true  #locking state
  }

}

provider "aws" {
  region = "us-east-1"
}


  