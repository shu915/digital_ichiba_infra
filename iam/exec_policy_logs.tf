resource "aws_iam_policy" "exec_policy_logs" {
  name = "DigitalIchibaExecRoleLogsPolicy"
  description = "DigitalIchibaExecRoleLogsPolicy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogStreams"
            ],
            "Resource": "*"
        }
    ]
})
}