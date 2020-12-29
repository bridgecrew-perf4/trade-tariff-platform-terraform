terraform {
  backend "s3" {
    bucket = "trade-tariff-terraform-state"
    key    = "common"
    region = "eu-west-2"
  }
}
