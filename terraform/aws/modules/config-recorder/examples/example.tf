module "config_recorder" {
  count = terraform.workspace == "dev" || terraform.workspace == "stage" ? 1 : 0

  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/config-recorder?ref=v?.?.?"

  app                         = var.app
  attach_permissions_boundary = terraform.workspace == "dev" || terraform.workspace == "qa" ? true : false
  config_s3_bucket_name       = aws_s3_bucket.config.bucket
  enable_config               = true
  env                         = terraform.workspace == "dev" || terraform.workspace == "qa" ? "nonprod" : "prod"
  manager_account_id          = var.manager_account_id
  program                     = var.program
  # recording_group_resource_types = ommitted to keep the default value provided by the module
}