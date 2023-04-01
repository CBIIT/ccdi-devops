resource "aws_config_config_rule" "ecr_private_image_scanning_enabled" {
  name        = "ecr-private-image-scanning-enabled"
  description = "Checks whether the Amazon ECR private repository image scanning is enabled."

  source {
    owner             = "AWS"
    source_identifier = "ECR_PRIVATE_IMAGE_SCANNING_ENABLED"
  }
}

resource "aws_config_config_rule" "ecr_private_lifecycle_policy_configured" {
  name        = "ecr-private-lifecycle-policy-configured"
  description = "Checks whether the Amazon ECR private repository lifecycle policy is configured."

  source {
    owner             = "AWS"
    source_identifier = "ECR_PRIVATE_LIFECYCLE_POLICY_CONFIGURED"
  }
}

resource "aws_config_config_rule" "ecr_private_tag_immutability_enabled" {
  name        = "ecr-private-tag-immutability-enabled"
  description = "Checks whether the Amazon ECR private repository tag immutability is enabled."

  source {
    owner             = "AWS"
    source_identifier = "ECR_PRIVATE_TAG_IMMUTABILITY_ENABLED"
  }
}

