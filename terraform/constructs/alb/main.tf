module "alb" {
  source = "../../modules/alb/"

  access_logs_bucket          = var.access_logs_bucket
  alb_listener_ssl_policy     = var.alb_listener_ssl_policy
  app                         = var.app
  domain_certificate_arn      = var.domain_certificate_arn
  drop_invalid_header_fields  = var.drop_invalid_header_fields
  enable_deletion_protection  = var.enable_deletion_protection
  fixed_response_content_type = var.fixed_response_content_type
  fixed_response_message_body = var.fixed_response_message_body
  fixed_response_status_code  = var.fixed_response_status_code
  http_port                   = var.http_port
  http_protocol               = var.http_protocol
  http_redirect_status_code   = var.http_redirect_status_code
  https_port                  = var.https_port
  https_protocol              = var.https_protocol
  internal                    = var.internal
  load_balancer_type          = var.load_balancer_type
  program                     = var.program
  security_group_id           = [module.security_group.id]
  timeout_create              = var.timeout_create
  public_subnets              = var.public_subnets
  tier                        = var.tier
}

module "security_group" {
  source = "../../modules/security-groups/alb-sg/"

  app                         = var.app
  program                     = var.program
  security_group_ingress_cidr = var.security_group_ingress_cidr
  tier                        = var.tier
  vpc_id                      = var.vpc_id
}

module "frontend_target_group" {
  source = "../../modules/target-group/"

  app                              = var.app
  health_check_path                = var.health_check_path
  health_check_protocol            = var.protocol
  health_check_port                = var.health_check_port
  health_check_matcher             = var.health_check_matcher
  health_check_interval            = var.health_check_interval
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  protocol                         = var.protocol
  stickiness_cookie_duration       = var.stickiness_cookie_duration
  stickiness_enabled               = var.stickiness_enabled
  stickiness_type                  = var.stickiness_type
  port                             = var.frontend_port
  program                          = var.program
  tier                             = var.tier
  target_description               = var.frontend_target_description
  vpc_id                           = var.vpc_id
}

module "backend_target_group" {
  source = "../../modules/target-group/"

  app                              = var.app
  health_check_path                = var.health_check_path
  health_check_protocol            = var.health_check_protocol
  health_check_port                = var.health_check_port
  health_check_matcher             = var.health_check_matcher
  health_check_interval            = var.health_check_interval
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  protocol                         = var.protocol
  stickiness_cookie_duration       = var.stickiness_cookie_duration
  stickiness_enabled               = var.stickiness_enabled
  stickiness_type                  = var.stickiness_type
  port                             = var.backend_port
  program                          = var.program
  tier                             = var.tier
  target_description               = var.backend_target_description
  vpc_id                           = var.vpc_id
}