resource "aws_cloudfront_cache_policy" "this" {
  name        = "${local.stack}-cache-policy"
  comment     = "defines which elements to cache and how long to cache them"
  default_ttl = var.default_ttl
  max_ttl     = var.max_ttl
  min_ttl     = var.min_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true

    cookies_config {
      cookie_behavior = var.cookie_behavior
    }

    headers_config {
      header_behavior = var.header_behavior

      headers {
        items = var.header_items
      }
    }

    query_strings_config {
      query_string_behavior = var.query_string_behavior
    }
  }
}
