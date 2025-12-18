resource "aws_iam_role_policy_attachment" "task_policy_s3_attachment" {
  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_policy_s3.arn
}