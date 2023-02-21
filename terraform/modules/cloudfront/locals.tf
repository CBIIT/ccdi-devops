locals {
  path_pattern              = "/content/immutable/*"
  allowed_methods           = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods            = ["GET", "HEAD"]
  restrictions_location     = ["US", "CA", "GB", "DE"]
  s3_origin_id              = ""
  default_min_ttl           = 0
  default_ttl               = 3600
  default_max_ttl           = 86400
  ordered_cache_min_ttl     = 0
  ordered_cache_default_ttl = 86400
  ordered_cache_max_ttl     = 31536000
  ordered_cache_compress    = true
  viewer_protocol_policy    = "redirect-to-https"
}