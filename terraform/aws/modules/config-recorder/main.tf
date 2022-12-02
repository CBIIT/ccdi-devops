resource "aws_config_configuration_recorder_status" "config" {
  name       = aws_config_configuration_recorder.config.name
  is_enabled = var.is_enabled
  depends_on = [aws_config_delivery_channel.config]
}

resource "aws_config_delivery_channel" "config" {
  name           = "${var.program}-${var.app}-${var.level}-config-delivery-channel"
  s3_bucket_name = var.service_log_bucket
  s3_key_prefix  = "${var.program}/${var.level}/${var.app}/config"
}

resource "aws_config_configuration_recorder" "config" {
  name     = "${var.program}-${var.app}-${var.level}-config-recorder"
  role_arn = aws_iam_role.config.arn
}

variable "is_enabled" {
  type        = bool
  description = "whether or not config is enabled"
}