resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = {
    Name = "digital-ichiba-route53-zone"
  }
}