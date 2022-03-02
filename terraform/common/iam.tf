resource "aws_iam_access_key" "service-account" {
  user = aws_iam_user.service-account.name
}

resource "aws_iam_user" "service-account" {
  name = "trade-tariff-service-account"
  path = "/system/"
}

resource "aws_iam_access_key" "ci-account" {
  user = aws_iam_user.ci-account.name
}

resource "aws_iam_user" "ci-account" {
  name = "trade-tariff-ci-account"
  path = "/system/"
}

resource "aws_iam_role" "ecr_access" {
  name = "ci-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_policy" "ecr_policy" {
  name        = "ecr-policy"
  description = "A test policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ecr:PutLifecyclePolicy",
                "ecr:PutImageTagMutability",
                "ecr:DescribeImageScanFindings",
                "ecr:StartImageScan",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:GetDownloadUrlForLayer",
                "ecr:PutImageScanningConfiguration",
                "ecr:ListTagsForResource",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:ListImages",
                "ecr:PutImage",
                "ecr:BatchGetImage",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeImages",
                "ecr:TagResource",
                "ecr:DescribeRepositories",
                "ecr:StartLifecyclePolicyPreview",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetRepositoryPolicy",
                "ecr:GetLifecyclePolicy"
            ],
            "Resource": "arn:aws:ecr:eu-west-2:777015734912:repository/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ecr:GetRegistryPolicy",
                "ecr:DescribeRegistry",
                "ecr:GetAuthorizationToken",
                "ecr:PutRegistryPolicy"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "ci-ecr" {
  user       = aws_iam_user.ci-account.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}

output "service_iam_id" {
  value = aws_iam_access_key.service-account.id
}

output "service_secret" {
  value     = aws_iam_access_key.service-account.secret
  sensitive = true
}

output "ci_iam_id" {
  value = aws_iam_access_key.service-account.id
}

output "ci_secret" {
  value     = aws_iam_access_key.service-account.secret
  sensitive = true
}
