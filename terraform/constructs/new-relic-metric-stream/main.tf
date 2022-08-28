module "cloudwatch_metric_stream" {
  source = "../../modules/cloudwatch-metric-stream/"

  #Required Variables
  account_id                   = var.account_id
  app                          = var.app
  firehose_delivery_stream_arn = module.kinesis_firehose.arn
  level                        = var.level
  program                      = var.program

  #Optional Variables
  iam_prefix                 = var.iam_prefix
  include_filter             = var.include_filter
  output_format              = var.output_format
  role_force_detach_policies = var.role_force_detach_policies

}

module "kinesis_firehose" {
  source = "../../modules/kinesis-firehose/"


}