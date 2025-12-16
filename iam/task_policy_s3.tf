resource "aws_iam_policy" "task_policy_s3" {
  name        = "DigitalIchibaTaskRoleS3CRUDPolicy"
  description = "DigitalIchibaTaskRoleS3CRUDPolicy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::aws-training-shu",
          "arn:aws:s3:::aws-training-shu/*"
        ]
      }
    ]
  })
}