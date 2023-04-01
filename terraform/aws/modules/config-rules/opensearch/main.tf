resource "aws_config_config_rule" "opensearch_access_control_enabled" {
  name = "opensearch-access-control-enabled"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_ACCESS_CONTROL_ENABLED"
  }
}

resource "aws_config_config_rule" "opensearch_audit_logging_enabled" {
  name = "opensearch-audit-logging-enabled"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_AUDIT_LOGGING_ENABLED"
  }
}

resource "aws_config_config_rule" "opensearch_data_node_fault_tolerance" {
  name = "opensearch-data-node-fault-tolerance"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_DATA_NODE_FAULT_TOLERANCE"
  }
}

resource "aws_config_config_rule" "opensearch_encrypted_at_rest" {
  name = "opensearch-encrypted-at-rest"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_ENCRYPTED_AT_REST"
  }
}

resource "aws_config_config_rule" "opensearch_https_required" {
  name = "opensearch-https-required"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_HTTPS_REQUIRED"
  }
}

resource "aws_config_config_rule" "opensearch_in_vpc_only" {
  name = "opensearch-in-vpc-only"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_IN_VPC_ONLY"
  }
}

resource "aws_config_config_rule" "opensearch_logs_to_cloudwatch" {
  name = "opensearch-logs-to-cloudwatch"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_LOGS_TO_CLOUDWATCH"
  }
}

resource "aws_config_config_rule" "opensearch_node_to_node_encryption_check" {
  name = "opensearch-node-to-node-encryption-check"

  source {
    owner             = "AWS"
    source_identifier = "OPENSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK"
  }
}
