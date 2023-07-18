resource "aws_api_gateway_stage" "this" {
  rest_api_id           = var.rest_api_id
  stage_name            = var.stage_name
  deployment_id         = var.deployment_id
  cache_cluster_enabled = var.cache_cluster_enabled
  cache_cluster_size    = var.cache_cluster_size
  client_certificate_id = var.client_certificate_id
  description           = var.description
  documentation_version = var.documentation_version
  variables             = var.variables
  xray_tracing_enabled  = var.xray_tracing_enabled


  canary_settings {
    percent_traffic          = var.canary_percent_traffic
    use_stage_cache = var.canary_use_stage_cache
    stage_variable_overrides = var.canary_stage_variable_overrides
  }

  access_log_settings {
    destination_arn = var.access_log_destination_arn
    format          = var.access_log_format
  }
}
