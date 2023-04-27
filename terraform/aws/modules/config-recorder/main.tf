resource "aws_config_configuration_recorder" "this" {
  name     = "${local.stack}-config-recorder"
  role_arn = module.role.arn

  recording_group {
    all_supported  = false
    resource_types = var.recording_group_resouce_types
  }
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = aws_config_configuration_recorder.this.name
  is_enabled = var.enable_config ? true : false

  depends_on = [
    aws_config_delivery_channel.this
  ]
}

resource "aws_config_delivery_channel" "this" {
  name           = "example"
  s3_bucket_name = var.config_s3_bucket_name
  s3_key_prefix  = "config"
}

module "role" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/config-recorder?ref=v3.0.12"

  app                         = var.app
  env                         = var.env
  program                     = var.program
  attach_permissions_boundary = var.attach_permissions_boundary
  config_s3_bucket_name       = var.config_s3_bucket_name
}
