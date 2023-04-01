resource "aws_config_config_rule" "alb_desync_mode_check" {
  name        = "alb-desync-mode-check"
  description = "Checks whether the desync mitigation mode is configured for the Application Load Balancer."

  source {
    owner             = "AWS"
    source_identifier = "ALB_DESYNC_MODE_CHECK"
  }

  tags = {
    triggerType = "changes"
  }
}

resource "aws_config_config_rule" "alb_http_drop_invalid_header_enabled" {
  name        = "alb-http-drop-invalid-header-enabled"
  description = "Checks whether the HTTP drop invalid header is enabled for the Application Load Balancer."

  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_DROP_INVALID_HEADER_ENABLED"
  }

  tags = {
    triggerType = "changes"
  }
}

resource "aws_config_config_rule" "alb_http_to_https_redirection_check" {
  count = var.enable_periodic_rules ? 1 : 0

  name        = "alb-http-to-https-redirection-check"
  description = "Checks whether the HTTP to HTTPS redirection is configured for the Application Load Balancer."

  source {
    owner             = "AWS"
    source_identifier = "ALB_HTTP_TO_HTTPS_REDIRECTION_CHECK"
  }

  tags = {
    triggerType = "periodic"
  }
}

resource "aws_config_config_rule" "alb_waf_enabled" {
  name        = "alb-waf-enabled"
  description = "Checks whether the AWS WAF web ACL is associated with the Application Load Balancer."

  source {
    owner             = "AWS"
    source_identifier = "ALB_WAF_ENABLED"
  }

  tags = {
    triggerType = "changes"
  }
}

resource "aws_config_config_rule" "elbv2_acm_certificate_required" {
  name        = "elbv2-acm-certificate-required"
  description = "Checks whether the Application Load Balancer is configured to use an ACM certificate."

  source {
    owner             = "AWS"
    source_identifier = "ELBV2_ACM_CERTIFICATE_REQUIRED"
  }

  tags = {
    triggerType = "schedule"
  }
}

resource "aws_config_config_rule" "elbv2_multiple_az" {
  name        = "elbv2-multiple-az"
  description = "Checks whether the Application Load Balancer is configured to use multiple Availability Zones."

  source {
    owner             = "AWS"
    source_identifier = "ELBV2_MULTIPLE_AZ"
  }

  tags = {
    triggerType = "changes"
  }
}

resource "aws_config_config_rule" "elb_deletion_protection_enabled" {
  name        = "elb-deletion-protection-enabled"
  description = "Checks whether the deletion protection is enabled for the Elastic Load Balancer."
  source {
    owner             = "AWS"
    source_identifier = "ELB_DELETION_PROTECTION_ENABLED"
  }

  tags = {
    triggerType = "changes"
  }
}
