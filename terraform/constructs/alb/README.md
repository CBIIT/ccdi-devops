Module Template:

<pre><code>
module "alb" {
  source = "github.com/CBIIT/ccdi-devops/terraform/constructs/alb"

# REQUIRED VARIABLES #####################
  access_logs_bucket                =
  app                               =
  domain_certificate_arn            =
  internal                          =
  program                           =
  public_subnets                    =
  security_group_ingress_cidr       =
  tier                              =
  vpc_id                            =

# OPTIONAL VARIABLES #####################
  alb_listener_ssl_policy           =
  backend_port                      =
  backend_target_description        =
  drop_invalid_header_fields        =
  enable_deletion_protection        =
  fixed_response_content_type       =
  fixed_response_message_body       = 
  fixed_response_status_code        =
  frontend_port                     =
  frontend_target_description       =
  health_check_interval             =
  health_check_matcher              =
  frontend_health_check_path        =
  backend_health_check_path         =
  health_check_port                 =
  health_check_protocol             =
  health_check_timeout              =
  health_check_healthy_threshold    =
  http_port                         =
  http_protocol                     =
  http_redirect_status_code         =
  https_port                        =
  https_protocol                    =
  load_balancer_type                =
  protocol                          =
  stickiness_cookie_duration        =
  stickiness_enabled                =
  stickiness_type                   =
  health_check_unhealthy_threshold  =
  target_type                       =
  timeout_create                    =
}
</code></pre>