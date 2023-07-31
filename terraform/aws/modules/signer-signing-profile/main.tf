resource "aws_signer_signing_profile" "this" {
  platform_id = local.platform
  name_prefix = local.stack
}
