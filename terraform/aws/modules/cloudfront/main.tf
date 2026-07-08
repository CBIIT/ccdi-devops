resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  wait_for_deployment = var.wait_for_deployment
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  price_class         = var.price_class
  default_root_object = var.default_root_object

  logging_config {
    bucket          = "ctos-nonprod-manager-cloudfront-standard-logs.s3.amazonaws.com"
    include_cookies = var.logging_config_include_cookies
    prefix          = "${var.program}/${var.env}/${var.app}/"
  }

  origin {
    connection_attempts = var.origin.connection_attempts
    connection_timeout  = var.origin.connection_timeout
    domain_name         = var.origin.domain_name
    origin_id           = var.origin.origin_id
  }

  default_cache_behavior {
    allowed_methods        = var.default_cache_behavior.allowed_methods
    cached_methods         = var.default_cache_behavior.cached_methods
    target_origin_id       = var.default_cache_behavior.target_origin_id
    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.restrictions_locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.viewer_certificate.acm_certificate_arn == null ? true : false
    acm_certificate_arn            = var.acm_certificate_arn
    minimum_protocol_version       = var.viewer_certificate.acm_certificate_arn == null ? null : var.viewer_certificate.minimum_protocol_version
    ssl_support_method             = var.viewer_certificate.acm_certificate_arn == null ? null : var.viewer_certificate.ssl_support_method
  }
}
