terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-k8"
        key = "minikube"
        region = "us-east-1"
        dynamodb_table = "terraform-lock"
    }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}