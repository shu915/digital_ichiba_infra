resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "alb_listener_https" {
  certificate_arn = var.certificate_arn
  load_balancer_arn = aws_lb.app_alb.arn
  port = 443
  protocol = "HTTPS"
  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.app_tg.arn
        weight = 1
      }
      stickiness {
        enabled  = false
        duration = 3600
      }
    }
  }
}