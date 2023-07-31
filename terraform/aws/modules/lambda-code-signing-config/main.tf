resource "aws_lambda_code_signing_config" "this" {
  description = var.description

  allowed_publishers {
    signing_profile_version_arns = var.signing_profile_version_arns
  }

  policies {
    untrusted_artifact_on_deployment = var.untrusted_artifact_on_deployment
  }
}
