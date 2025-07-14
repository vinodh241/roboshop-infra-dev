  module "frontend_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = false
  version = "9.16.0"
  name    = "${var.project}-${var.environment}-frontend-alb" # roboshop-dev-frontend_alb
  vpc_id  = local.vpc_id
  subnets = local.public_subnet_ids_
  # Security Group
  create_security_group = false
  security_groups = [local.frontend_alb_sg_id]
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-frontend-alb"
    }
  )
}

# creating load balancer lister ( noting but port opeings)

resource "aws_lb_listener" "frontend-alb" {
  load_balancer_arn = module.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.acm_certificate_arn
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from frontend ALB using HTTPS</h1>"
      status_code  = "200"
    }
  }
} 

resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id
  name    ="*.${var.zone_name}"  # dev.vinodh.site
  type    = "A"

  alias {
    name                   = module.frontend_alb.dns_name
    zone_id                = module.frontend_alb.zone_id  # this the zone id of ALB not ours 
    evaluate_target_health = true  
  }
}