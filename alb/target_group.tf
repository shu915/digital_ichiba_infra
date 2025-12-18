resource "aws_lb_target_group" "app_tg" {
  name        = "digital-ichiba-alb-tg"
  target_type = "ip"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  tags = {
    Name = "digital-ichiba-alb-tg"
  }

  health_check {
    path                = "/up"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}