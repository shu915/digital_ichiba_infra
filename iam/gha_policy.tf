resource "aws_iam_policy" "gha_policy" {
  name = "DigitalIchibaGithubActionsDeployPolicy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid": "EcrAuth",
        "Effect": "Allow",
        "Action": "ecr:GetAuthorizationToken",
        "Resource": "*"
      },
      {
        "Sid": "EcrPush",
        "Effect": "Allow",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ],
        "Resource": "arn:aws:ecr:ap-northeast-1:575357958164:repository/digital-ichiba-ecr"
      },
      {
        "Sid" : "EcsDeploy",
        "Effect" : "Allow",
        "Action" : [
          "ecs:RegisterTaskDefinition",
          "ecs:DescribeServices",
          "ecs:DescribeTaskDefinition",
          "ecs:UpdateService"
        ],
        "Resource" : [
          "arn:aws:ecs:ap-northeast-1:575357958164:service/digital-ichiba-cluster/*",
          "arn:aws:ecs:ap-northeast-1:575357958164:task-definition/digital-ichiba-*:*"
        ]
      },
      {
        "Sid" : "PassTaskRolesToEcs",
        "Effect" : "Allow",
        "Action" : "iam:PassRole",
        "Resource" : [
          "arn:aws:iam::575357958164:role/DigitalIchibaEcsTaskRole",
          "arn:aws:iam::575357958164:role/DigitalIchibaEcsTaskExecRole"
        ]
      }
    ]
  })
}