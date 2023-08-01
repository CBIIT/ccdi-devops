resource "aws_signer_signing_profile" "this" {
  platform_id = local.platform
  name_prefix = "${var.program}_${var.env}_${var.app}"
}
