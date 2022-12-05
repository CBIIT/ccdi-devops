module "cloudfront" {
  source = "../../modules/cloudfront/"

  create_distribution           = var.create_distribution
  create_origin_access_identity = var.create_origin_access_identity
  origin_access_identities      = var.origin_access_identities
  aliases                       = var.aliases
  comment                       = var.comment
  default_root_object           = var.default_root_object
  enabled                       = var.enabled
  http_version                  = var.http_version
  is_ipv6_enabled               = var.is_ipv6_enabled
  price_class                   = var.price_class
  retain_on_delete              = var.retain_on_delete
  wait_for_deployment           = var.wait_for_deployment
  web_acl_id                    = var.web_acl_id
  tags                          = var.tags
  origin                        = var.origin
  origin_group                  = var.origin_group
  viewer_certificate            =  var.viewer_certificate
  geo_restriction               = var.geo_restriction
  logging_config                = var.logging_config
  custom_error_response         = var.custom_error_response
  default_cache_behavior        = var.default_cache_behavior
  ordered_cache_behavior        = var.ordered_cache_behavior
}