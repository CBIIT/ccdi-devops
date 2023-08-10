resource "aws_cloudfront_response_headers_policy" "this" {
  name    = "${local.stack}-response-headers-policy"
  comment = "defines which headers to include in responses that cloudfront caches"

  cors_config {
    access_control_allow_credentials = var.access_control_allow_credentials

    access_control_allow_origins {
      items = var.access_control_allow_origins
    }

    access_control_allow_methods {
      items = var.access_control_allow_methods
    }

    access_control_allow_headers {
      items = var.access_control_allow_headers
    }

    origin_override = var.origin_override
  }
}
