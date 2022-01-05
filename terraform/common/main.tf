terraform {
  backend "s3" {
    bucket = "trade-tariff-terraform-state"
    key    = "common"
    region = "eu-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.33.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
