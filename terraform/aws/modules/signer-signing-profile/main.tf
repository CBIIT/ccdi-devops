resource "aws_signer_signing_profile" "this" {
  platform_id = local.platform
  name_prefix = "${var.program}${var.env}${var.app}"
}
