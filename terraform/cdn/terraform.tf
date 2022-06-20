terraform {
  backend "s3" {
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.72.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}