module "new_relic_metric_stream" {
  source = "github.com/CBIIT/ccdi-devops/terraform/constructs/new-relic-metric-stream/"

  account_id               = data.aws_caller_identity.current.account_id
  app                      = local.app
  external_id              = var.external_id
  http_endpoint_access_key = var.new_relic_api_key
  level                    = local.level
  program                  = local.program
}
