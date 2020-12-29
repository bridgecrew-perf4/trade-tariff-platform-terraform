
resource "aws_ses_email_identity" "notify-email" {
  email = var.notification_email
}

resource "aws_iam_user_policy" "ses-policy" {
  name   = "ses-send-emails"
  policy = data.aws_iam_policy_document.ses-policy.json
  user   = aws_iam_user.service-account.name
}


data "aws_iam_policy_document" "ses-policy" {
  statement {
    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail"
    ]

    resources = [
      "*"
    ]
  }
}
