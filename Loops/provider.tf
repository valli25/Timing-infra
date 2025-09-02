terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

  } 
  
    
  
backend "s3" {
        bucket = "terraform-k8"
        key = "Loops"
        region = "us-east-1"
        dynamodb_table = "terraform-lock"
    }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

