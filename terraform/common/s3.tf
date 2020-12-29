resource "aws_s3_bucket" "persistence" {
  count = length(var.environments)

  bucket = "${var.project-key}-persistence-${var.environments[count.index]}"
  acl    = "private"

  tags = {
    Project     = var.project-key
    Environment = element(var.environments, count.index)
  }
}


resource "aws_s3_bucket_public_access_block" "example" {
  count = length(aws_s3_bucket.persistence)
  bucket = aws_s3_bucket.persistence.*.id[count.index]

  restrict_public_buckets = true
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
}
