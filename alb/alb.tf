resource "aws_lb" "app_alb" {
  name = "digital-ichiba-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.alb_security_group_id]
  subnets = [var.public_subnet_1a_id, var.public_subnet_1c_id]
  tags = {
    Name = "digital-ichiba-alb"
  }
}