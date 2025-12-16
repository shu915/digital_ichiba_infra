resource "aws_iam_role" "exec_role" {
  name = "DigitalIchibaEcsTaskExecRole"
  description = "DigitalIchibaEcsTaskExecRole"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAccessToECSForTaskExecutionRole",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
})
}