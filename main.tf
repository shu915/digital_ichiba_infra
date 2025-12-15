module "network" {
  source = "./network"
}

module "route53" {
  source       = "./route53"
  domain_name  = var.domain_name
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}

module "alb" {
  source                = "./alb"
  vpc_id                = module.network.vpc_id
  public_subnet_1a_id   = module.network.public_subnet_1a_id
  public_subnet_1c_id   = module.network.public_subnet_1c_id
  alb_security_group_id = module.network.alb_security_group_id
  certificate_arn       = data.aws_acm_certificate.main.arn
}

module "iam" {
  source = "./iam"
}