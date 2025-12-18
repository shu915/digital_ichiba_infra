resource "aws_ecs_service" "digital_ichiba_service" {
  name = "digital-ichiba-service"

  cluster = aws_ecs_cluster.digital_ichiba_cluster.id

  enable_ecs_managed_tags = true

  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 1
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [var.app_security_group_id]
    subnets          = var.public_subnet_ids
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}