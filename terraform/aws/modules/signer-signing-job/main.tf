resource "aws_signer_signing_job" "this" {
  profile_name               = var.profile_name
  ignore_signing_job_failure = var.ignore_signing_job_failure

  source {
    s3 {
      bucket  = var.source_bucket
      key     = var.source_key
      version = var.source_version
    }
  }

  destination {
    s3 {
      bucket = var.destination_bucket
      prefix = var.destination_prefix
    }
  }
}
