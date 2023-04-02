resource "aws_config_config_rule" "cloudfront_accesslogs_enabled" {
  name = "cloudfront-accesslogs-enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_ACCESSLOGS_ENABLED"
  }
}

resource "aws_config_config_rule" "cloudfront_associated_with_waf" {
  name = "cloudfront-associated-with-waf"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_ASSOCIATED_WITH_WAF"
  }
}

resource "aws_config_config_rule" "cloudfront_custom_ssl_certificate" {
  name = "cloudfront-custom-ssl-certificate"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_CUSTOM_SSL_CERTIFICATE"
  }
}

resource "aws_config_config_rule" "cloudfront_default_root_object_configured" {
  name = "cloudfront-default-root-object-configured"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_DEFAULT_ROOT_OBJECT_CONFIGURED"
  }
}

resource "aws_config_config_rule" "cloudfront_no_deprecated_ssl_protocols" {
  name = "cloudfront-no-deprecated-ssl-protocols"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_NO_DEPRECATED_SSL_PROTOCOLS"
  }
}

resource "aws_config_config_rule" "cloudfront_origin_access_identity_enabled" {
  name = "cloudfront-origin-access-identity-enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_ORIGIN_ACCESS_IDENTITY_ENABLED"
  }
}

resource "aws_config_config_rule" "cloudfront_origin_failover_enabled" {
  name = "cloudfront-origin-failover-enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_ORIGIN_FAILOVER_ENABLED"
  }
}

resource "aws_config_config_rule" "cloudfront_security_policy_check" {
  name = "cloudfront-security-policy-check"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_SECURITY_POLICY_CHECK"
  }
}

resource "aws_config_config_rule" "cloudfront_sni_enabled" {
  name = "cloudfront-sni-enabled"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_SNI_ENABLED"
  }
}

resource "aws_config_config_rule" "cloudfront_traffic_to_origin_encrypted" {
  name = "cloudfront-traffic-to-origin-encrypted"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_TRAFFIC_TO_ORIGIN_ENCRYPTED"
  }
}

resource "aws_config_config_rule" "cloudfront_viewer_policy_https" {
  name = "cloudfront-viewer-policy-https"

  source {
    owner             = "AWS"
    source_identifier = "CLOUDFRONT_VIEWER_POLICY_HTTPS"
  }
}

