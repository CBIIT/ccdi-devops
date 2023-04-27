resource "aws_config_conformance_pack" "this" {
  name            = "fnl-aws-config-conformance-pack-nist-800-53-rev-5"
  template_s3_uri = "s3://${var.config_s3_bucket_name}/${aws_s3_object.this.key}"
}

resource "aws_s3_object" "this" {
  bucket = var.config_s3_bucket_name
  key    = "templates/nist-800-53-rev-5.yaml"
  source = "nist-800-53-rev-5.yaml"
}