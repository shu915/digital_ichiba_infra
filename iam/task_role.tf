resource "aws_iam_role" "task_role" {
  name        = "DigitalIchibaEcsTaskRole"
  description = "DigitalIchibaEcsTaskRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}