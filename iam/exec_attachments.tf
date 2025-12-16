resource "aws_iam_role_policy_attachment" "exec_managed_policy_attachment" {
  role       = aws_iam_role.exec_role.name
  policy_arn = data.aws_iam_policy.ecs_task_execution_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "exec_policy_secrets_attachment" {
  role       = aws_iam_role.exec_role.name
  policy_arn = aws_iam_policy.exec_policy_secrets.arn
}

resource "aws_iam_role_policy_attachment" "exec_policy_logs_attachment" {
  role       = aws_iam_role.exec_role.name
  policy_arn = aws_iam_policy.exec_policy_logs.arn
}