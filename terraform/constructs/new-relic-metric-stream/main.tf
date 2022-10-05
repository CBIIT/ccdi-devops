module "cloudwatch_metric_stream" {
  source = "../../modules/cloudwatch-metric-stream/"

  #Required Variables
  account_id = var.account_id
  app        = var.app
  level      = var.level
  program    = var.program

  #Optional Variables
  firehose_delivery_stream_arn = module.kinesis_firehose.arn
  iam_prefix                   = var.iam_prefix
  include_filter               = var.include_filter
  output_format                = var.output_format
  role_force_detach_policies   = var.role_force_detach_policies

  depends_on = [module.kinesis_firehose]
}

module "kinesis_firehose" {
  source = "../../modules/kinesis-firehose/"

  #Required Variables
  account_id               = var.account_id
  app                      = var.app
  external_id              = var.external_id
  http_endpoint_access_key = var.http_endpoint_access_key
  level                    = var.level
  program                  = var.program

  #Optional Variables 
  buffer_interval        = var.buffer_interval
  buffer_size            = var.buffer_size
  content_encoding       = var.content_encoding
  destination            = var.destination
  http_endpoint_name     = var.http_endpoint_name
  http_endpoint_url      = var.http_endpoint_url
  s3_backup_mode         = var.s3_backup_mode
  s3_compression_format  = var.s3_compression_format
  s3_error_output_prefix = var.s3_error_output_prefix
  s3_object_prefix       = var.s3_object_prefix
}
