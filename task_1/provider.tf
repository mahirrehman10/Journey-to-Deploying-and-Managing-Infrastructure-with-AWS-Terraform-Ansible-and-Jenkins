terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.78.0"
    }
  }
 # Configure S3 for storing the tf state file
  backend "s3" {
    bucket = "taskneedbucket"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}




provider "aws" {
  region = "us-east-1"
}