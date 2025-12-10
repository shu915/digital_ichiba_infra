resource "aws_route53_record" "acm_validation" {
  zone_id = aws_route53_zone.main.zone_id
  name = "_51a4bf1957e9b6680931b385a5988bef.${var.domain_name}"
  type = "CNAME"
  ttl = 300
  records = [
    "_9f233a979db17078aca89c163ede101c.xlfgrmvvlj.acm-validations.aws."
  ]
}

resource "aws_route53_record" "root_vercel" { 
  zone_id = aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"
  ttl = 300
  records = ["216.198.79.1"]
}

resource "aws_route53_record" "api_alb" {
  zone_id = aws_route53_zone.main.zone_id
  name = "api.${var.domain_name}"
  type = "A"

  alias {
    name = var.alb_dns_name
    zone_id = var.alb_zone_id
    evaluate_target_health = true
  }
}