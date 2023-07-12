resource "aws_config_conformance_pack" "this" {
  name            = "fnl-aws-config-conformance-pack-nist-800-53-rev-5"
  template_s3_uri = var.create_config_s3_bucket ? "s3://${module.s3[0].bucket}/${aws_s3_object.this.key}}" : "s3://${var.config_s3_bucket_name}/${aws_s3_object.this.key}"
}

resource "aws_s3_object" "this" {
  bucket = var.create_config_s3_bucket ? module.s3[0].id : var.config_s3_bucket_name
  key    = "templates/nist-800-53-rev-5.yaml"
  source = "${path.module}/nist-800-53-rev-5.yaml"
}

module "s3" {
  count  = var.create_config_s3_bucket ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3?ref=task-deinitions"

  app                   = var.app
  bucket_suffix         = "config-conformance-pack"
  env                   = var.env
  force_destroy         = true
  program               = var.program
  versioning_enabled    = true
}