resource "aws_iam_service_linked_role" "os" {
  count = var.tier == "dev" || var.tier == "stage" ? 1 : 0

  aws_service_name = "opensearchservice.amazonaws.com"
  description      = "creates the AWSServiceRoleForAmazonOpenSearchService role"

  lifecycle {
    ignore_changes = [
      tags_all,
    ]
  }
}

resource "aws_opensearch_domain" "os" {
  domain_name    = "${var.program}-${var.tier}-${var.app}-opensearch"
  engine_version = "OpenSearch_${var.engine_version}"

  cluster_config {
    dedicated_master_enabled = var.master_node_enabled
    dedicated_master_count   = var.master_node_enabled ? var.master_node_count : null
    dedicated_master_type    = var.master_node_enabled ? var.master_node_type : null

    instance_count = var.hot_node_count
    instance_type  = var.hot_node_type

    warm_enabled = var.warm_node_enabled
    warm_count   = var.warm_node_enabled ? var.warm_node_count : null
    warm_type    = var.warm_node_enabled ? var.warm_node_type : null

    cold_storage_options {
      enabled = var.cold_storage_enabled
    }

    zone_awareness_enabled = var.multi_az

    zone_awareness_config {
      availability_zone_count = var.availability_zone_count
    }
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_size = var.ebs_enabled ? var.ebs_volume_size : null
    iops        = var.ebs_enabled ? var.ebs_iops : null
    volume_type = var.ebs_enabled ? var.ebs_volume_type : null
    throughput  = var.ebs_enabled ? var.ebs_throughput : null
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.opensearch_security_group_id
  }

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_hour
  }

  domain_endpoint_options {
    enforce_https           = var.enforce_https
    tls_security_policy     = var.enforce_https ? "Policy-Min-TLS-1-2-2019-07" : null
    custom_endpoint_enabled = var.custom_domain_endpoint_enabled
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  log_publishing_options {
    enabled                  = var.enable_os_index_slow_logs
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_index_slow.arn
    log_type                 = "INDEX_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = var.enable_os_search_slow_logs
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_search_slow.arn
    log_type                 = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = var.enable_os_application_logs
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.os_app.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }
}

resource "aws_opensearch_domain_policy" "os" {
  count = var.create_domain_policy ? 1 : 0

  domain_name     = aws_opensearch_domain.os.domain_name
  access_policies = data.aws_iam_policy_document.os[count.index].json

  lifecycle {
    ignore_changes = [
      access_policies,
    ]
  }
}

data "aws_iam_policy_document" "os" {
  count = var.create_domain_policy ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "es:ESHttpPut",
      "es:ESHttpPost",
      "es:ESHttpPatch",
      "es:ESHttpHead",
      "es:ESHttpGet",
      "es:ESHttpDelete"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_opensearch_domain.os.arn}/*"]
  }
}

resource "aws_cloudwatch_log_group" "os_index_slow" {
  # checkov:skip=CKV_AWS_158: Do not need to encrypt these logs with KMS, already encrypted with AES-256
  name              = "${var.program}-${var.tier}-${var.app}-opensearch-index-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_search_slow" {
  # checkov:skip=CKV_AWS_158: Do not need to encrypt these logs with KMS, already encrypted with AES-256
  name              = "${var.program}-${var.tier}-${var.app}-opensearch-search-slow-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_group" "os_app" {
  # checkov:skip=CKV_AWS_158: Do not need to encrypt these logs with KMS, already encrypted with AES-256
  name              = "${var.program}-${var.tier}-${var.app}-opensearch-application-logs"
  retention_in_days = var.log_retention
}

resource "aws_cloudwatch_log_resource_policy" "os" {
  policy_name     = "${var.iam_prefix}-${var.program}-${var.tier}-${var.app}-opensearch-logs"
  policy_document = data.aws_iam_policy_document.cloudwatch.json
}

data "aws_iam_policy_document" "cloudwatch" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }
    actions = [
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
      "logs:CreateLogStream"
    ]
    resources = ["arn:aws:logs:*"]
  }
}
