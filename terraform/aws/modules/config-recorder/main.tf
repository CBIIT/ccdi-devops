resource "aws_config_configuration_recorder" "this" {
  name     = "${local.stack}-config-recorder"
  role_arn = aws_iam_role.r.arn
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

resource "aws_iam_role" "this" {
  name               = "power-user-${local.stack}-config-role"
  description        = "config role for ${local.stack}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-config-role-policy"
  description = "config role policy for ${local.stack}"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "aws_managed" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}
