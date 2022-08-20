resource "aws_config_configuration_recorder_status" "config" {
  name       = aws_config_configuration_recorder.config.name
  is_enabled = true
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

resource "aws_iam_role" "config" {
  name                 = "${var.iam_prefix}-config-role"
  assume_role_policy   = data.aws_iam_policy_document.config_assume_role.json
  permissions_boundary = var.permission_boundary_arn
}

data "aws_iam_policy_document" "config_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "managed" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_iam_role_policy_attachment" "config" {
  role       = aws_iam_role.config.name
  policy_arn = aws_iam_policy.config_policy.arn
}

resource "aws_iam_policy" "config_policy" {
  name   = "${var.iam_prefix}-config-role-policy"
  policy = data.aws_iam_policy_document.config.json
}

data "aws_iam_policy_document" "config" {
  statement {
    actions = ["s3:*"]
    effect  = "Allow"
    resources = [
      "arn:aws:s3:::${var.service_log_bucket}",
      "arn:aws:s3:::${var.service_log_bucket}/*"
    ]
  }
}
