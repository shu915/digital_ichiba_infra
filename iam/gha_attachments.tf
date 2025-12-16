resource "aws_iam_role_policy_attachment" "gha_policy_attachment" {
  role = aws_iam_role.gha_role.name
  policy_arn = aws_iam_policy.gha_policy.arn
}