variable "domain_name" {
  type        = string
  description = "The domain name for the Route53"
}

variable "alb_dns_name" {
  type        = string
  description = "The DNS name of the ALB"
}

variable "alb_zone_id" {
  type        = string
  description = "The Zone ID of the ALB"
}