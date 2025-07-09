  module "backend_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true
  version = "9.16.0"
  name    = "${var.project}-${var.environment}-backend-alb" # roboshop-dev-backend-alb
  vpc_id  = local.vpc_id
  subnets = local.private_subnet_ids
  # Security Group
  create_security_group = false
  security_groups = [local.backend_alb_sg_id]
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-backend-alb"
    }
  )
}

# creating load balancer lister ( noting but port opeings)

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = module.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> Hello I am from backend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    ="*.backend-dev .${var.zone_name}"
  type    = "A"

  alias {
    name                   = module.backend_alb.dns_name
    zone_id                = module.backend_alb.zone_id  # this the zone id of ALB not ours 
    evaluate_target_health = true  
  }
}