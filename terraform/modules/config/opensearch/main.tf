resource "aws_config_config_rule" "opensearch_audit_logging_enabled" {
  count = var.opensearch_audit_logging_enabled == true ? 1 : 0

  name        = "opensearch-audit-logging-enabled"
  description = "Checks if Amazon OpenSearch Service domains have audit logging enabled. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_AUDIT_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "opensearch_encrypted_at_rest" {
  count = var.opensearch_encrypted_at_rest == true ? 1 : 0

  name        = "opensearch-encrypted-at-rest"
  description = "Checks if Amazon OpenSearch Service domains have encryption at rest configuration enabled. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_ENCRYPTED_AT_REST"
  }
}

resource "aws_config_config_rule" "opensearch_https_required" {
  count = var.opensearch_https_required == true ? 1 : 0

  name        = "opensearch-https-required"
  description = "Checks whether connections to OpenSearch domains are using HTTPS. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_HTTPS_REQUIRED"
  }
}

resource "aws_config_config_rule" "opensearch_in_vpc_only" {
  count = var.opensearch_in_vpc_only == true ? 1 : 0

  name        = "opensearch-in-vpc-only"
  description = "Checks if Amazon OpenSearch Service domains are in an Amazon Virtual Private Cloud (VPC). Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_IN_VPC_ONLY"
  }
}

resource "aws_config_config_rule" "opensearch_logs_to_cloudwatch" {
  count = var.opensearch_logs_to_cloudwatch == true ? 1 : 0

  name        = "opensearch-logs-to-cloudwatch"
  description = "Checks if Amazon OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_LOGS_TO_CLOUDWATCH"
  }
}

resource "aws_config_config_rule" "opensearch_node_to_node_encryption_check" {
  count = var.opensearch_node_to_node_encryption_check == true ? 1 : 0

  name        = "opensearch-node-to-node-encryption-enabled"
  description = "Check that Amazon OpenSearch Service nodes are encrypted end to end. Triggered only when changes to OpenSearch resources are applied in an environment."

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK"
  }
}