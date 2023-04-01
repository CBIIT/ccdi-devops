resource "aws_config_config_rule" "elasticsearch_encrypted_at_rest" {
  name        = "elasticsearch-encrypted-at-rest"
  description = "Checks whether Amazon Elasticsearch Service domains are encrypted at rest."

  source {
    owner             = "AWS"
    source_identifier = "ELASTICSEARCH_ENCRYPTED_AT_REST"
  }
}

resource "aws_config_config_rule" "elasticsearch_in_vpc_only" {
  name        = "elasticsearch-in-vpc-only"
  description = "Checks whether Amazon Elasticsearch Service domains are configured to be accessible only from within a VPC."

  source {
    owner             = "AWS"
    source_identifier = "ELASTICSEARCH_IN_VPC_ONLY"
  }
}

resource "aws_config_config_rule" "elasticsearch_logs_to_cloudwatch" {
  name        = "elasticsearch-logs-to-cloudwatch"
  description = "Checks whether Amazon Elasticsearch Service domains are configured to send logs to CloudWatch Logs."

  source {
    owner             = "AWS"
    source_identifier = "ELASTICSEARCH_LOGS_TO_CLOUDWATCH"
  }
}

resource "aws_config_config_rule" "elasticsearch_node_to_node_encryption_check" {
  name        = "elasticsearch-node-to-node-encryption-check"
  description = "Checks whether Amazon Elasticsearch Service domains are configured to use node-to-node encryption."

  source {
    owner             = "AWS"
    source_identifier = "ELASTICSEARCH_NODE_TO_NODE_ENCRYPTION_CHECK"
  }
}

