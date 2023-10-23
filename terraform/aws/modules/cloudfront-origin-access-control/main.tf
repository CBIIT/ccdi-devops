resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "${local.stack}-origin-access-control"
  description                       = var.description
  origin_access_control_origin_type = var.origin_access_control_origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol
}
