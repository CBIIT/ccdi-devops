resource "aws_config_config_rule" "alb_desync_mode_check" {
  name = "alb-desync-mode-check"

  source {
    owner             = "AWS"
    source_identifier = "ALB_DESYNC_MODE_CHECK"
  }
}

resource "aws_config_config_rule" "alb_http_drop_invalid_header_enabled" {
  name = "alb-http-drop-invalid-header-enabled"
  
  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_DROP_INVALID_HEADER_ENABLED"
  }
}

resource "aws_config_config_rule" "alb_http_to_https_redirection_check" {
  name = "alb-http-to-https-redirection-check"
  
  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_TO_HTTPS_REDIRECTION_CHECK"
  }
}

resource "aws_config_config_rule" "alb_waf_enabled" {
  name = "alb-waf-enabled"
  
  
  source {
    owner             = "AWS"
    source_identifier = "ALB_WAF_ENABLED"
  }
}

resource "aws_config_config_rule" "elb_acm_certificate_required" { name = "elb-acm-certificate-required" source { owner = "AWS" source_identifier = "ELB_ACM_CERTIFICATE_REQUIRED" } }
resource "aws_config_config_rule" "elb_cross_zone_load_balancing_enabled" { name = "elb-cross-zone-load-balancing-enabled" source { owner = "AWS" source_identifier = "ELB_CROSS_ZONE_LOAD_BALANCING_ENABLED" } }
resource "aws_config_config_rule" "elb_custom_security_policy_ssl_check" { name = "elb-custom-security-policy-ssl-check" source { owner = "AWS" source_identifier = "ELB_CUSTOM_SECURITY_POLICY_SSL_CHECK" } }
resource "aws_config_config_rule" "elb_deletion_protection_enabled" { name = "elb-deletion-protection-enabled" source { owner = "AWS" source_identifier = "ELB_DELETION_PROTECTION_ENABLED" } }
resource "aws_config_config_rule" "elb_logging_enabled" { name = "elb-logging-enabled" source { owner = "AWS" source_identifier = "ELB_LOGGING_ENABLED" } }
resource "aws_config_config_rule" "elb_predefined_security_policy_ssl_check" { name = "elb-predefined-security-policy-ssl-check" source { owner = "AWS" source_identifier = "ELB_PREDEFINED_SECURITY_POLICY_SSL_CHECK" } }
resource "aws_config_config_rule" "elb_tls_https_listeners_only" { name = "elb-tls-https-listeners-only" source { owner = "AWS" source_identifier = "ELB_TLS_HTTPS_LISTENERS_ONLY" } }
resource "aws_config_config_rule" "elbv2_acm_certificate_required" { name = "elbv2-acm-certificate-required" source { owner = "AWS" source_identifier = "ELBV2_ACM_CERTIFICATE_REQUIRED" } }
resource "aws_config_config_rule" "elbv2_multiple_az" { name = "elbv2-multiple-az" source { owner = "AWS" source_identifier = "ELBV2_MULTIPLE_AZ" } }
