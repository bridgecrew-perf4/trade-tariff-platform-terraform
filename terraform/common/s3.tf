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
  count  = length(aws_s3_bucket.persistence)
  bucket = aws_s3_bucket.persistence.*.id[count.index]

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}


resource "aws_iam_user_policy" "policy" {
  name   = "s3-bucket-read-write"
  policy = data.aws_iam_policy_document.s3-policy.json
  user   = aws_iam_user.service-account.name
}


data "aws_iam_policy_document" "s3-policy" {
  statement {
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
    ]
    resources = formatlist("%s", aws_s3_bucket.persistence.*.arn)
  }

  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:DeleteObject",
      "s3:DeleteObjectTagging",
      "s3:DeleteObjectVersion",
      "s3:DeleteObjectVersionTagging",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectTagging",
      "s3:GetObjectTorrent",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
      "s3:GetObjectVersionTorrent",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionAcl",
      "s3:PutObjectVersionTagging",
      "s3:RestoreObject",
    ]

    resources = formatlist("%s", aws_s3_bucket.persistence.*.arn)
  }
}
