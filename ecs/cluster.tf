resource "aws_ecs_cluster" "digital_ichiba_cluster" {
  name = "digital-ichiba-cluster"

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }
}