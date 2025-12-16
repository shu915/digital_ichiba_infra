resource "aws_iam_policy" "exec_policy_secrets" {
  name        = "DigitalIchibaExecRoleSecretsPolicy"
  description = "DigitalIchibaExecRoleSecretsPolicy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ],
        "Resource" : "arn:aws:secretsmanager:ap-northeast-1:575357958164:secret:digital-ichiba-9eAozm"
      }
    ]
  })
}