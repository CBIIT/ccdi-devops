resource "aws_opensearch_domain" "this" {
  domain_name    = "${local.stack}-${var.domain_name_suffix}"
  engine_version = var.engine_version

  cluster_config {
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_count   = var.dedicated_master_enabled ? var.dedicated_master_count : null
    dedicated_master_type    = var.dedicated_master_enabled ? var.dedicated_master_type : null

    instance_count = var.instance_count
    instance_type  = var.instance_type

    warm_enabled = var.warm_enabled
    warm_count   = var.warm_enabled ? var.warm_count : null
    warm_type    = var.warm_enabled ? var.warm_type : null

    cold_storage_options {
      enabled = var.cold_storage_enabled
    }

    zone_awareness_enabled = var.zone_awareness_enabled

    zone_awareness_config {
      availability_zone_count = var.zone_awareness_enabled ? var.availability_zone_count : null
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
    subnet_ids         = var.zone_awareness_enabled ? var.subnet_ids : [element(var.subnet_ids, 0)]
    security_group_ids = var.create_security_group ? [aws_security_group.this[0].id] : var.security_group_ids
  }

  snapshot_options {
    automated_snapshot_start_hour = var.automated_snapshot_start_hour
  }

  domain_endpoint_options {
    enforce_https           = var.enforce_https
    tls_security_policy     = var.enforce_https ? "Policy-Min-TLS-1-2-2019-07" : null
    custom_endpoint_enabled = var.custom_endpoint_enabled
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }

  log_publishing_options {
    enabled                  = true
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.index_slow.arn
    log_type                 = "INDEX_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = true
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.search_slow.arn
    log_type                 = "SEARCH_SLOW_LOGS"
  }

  log_publishing_options {
    enabled                  = true
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.error.arn
    log_type                 = "ES_APPLICATION_LOGS"
  }

  tags = merge(

    {
      "Name" = "${local.stack}-${var.domain_name_suffix}"
    },
    var.tags
  )

  depends_on = [
    aws_iam_role.this
  ]
}

resource "aws_opensearch_domain_policy" "this" {
  count = var.create_domain_policy ? 1 : 0

  domain_name     = aws_opensearch_domain.this.domain_name
  access_policies = data.aws_iam_policy_document.domain_policy[0].json

  lifecycle {
    ignore_changes = [
      access_policies,
    ]
  }
}

resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-${var.domain_name_suffix}-role"
  description          = "role to enable creation of opensearch and routine opensearch operations"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary
}

resource "aws_iam_policy" "service-linked-role-policy" {
  name        = "power-user-opensearch-test-policy"
  description = "policy to enable creation of opensearch and routine opensearch operations"
  policy      = data.aws_iam_policy_document.service_linked_role_policy.json
}

resource "aws_iam_role_policy_attachment" "service_linked_role_policy" {
  role       = aws_iam_role.os.name
  policy_arn = aws_iam_policy.os.arn
}

resource "aws_iam_policy" "manual_snapshot" {
  count = var.create_manual_snapshot_role ? 1 : 0

  name        = "power-user-${local.stack}-${var.domain_name_suffix}-manual-snapshot-policy"
  description = "policy to enable opensearch manual snapshot operations"
  policy      = data.aws_iam_policy_document.manual_snapshot[0].json
}

resource "aws_iam_role_policy_attachment" "manual_snapshot" {
  count = var.create_manual_snapshot_role ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.manual_snapshot[0].arn
}

resource "aws_cloudwatch_log_group" "index_slow" {
  name              = "${local.stack}-${var.domain_name_suffix}-index-slow-logs"
  retention_in_days = var.cloudwatch_log_retention_in_days
  tags              = var.tags
}

resource "aws_cloudwatch_log_group" "search_slow" {
  name              = "${local.stack}-${var.domain_name_suffix}-search-slow-logs"
  retention_in_days = var.cloudwatch_log_retention_in_days
  tags              = var.tags
}

resource "aws_cloudwatch_log_group" "error" {
  name              = "${local.stack}-${var.domain_name_suffix}-error-logs"
  retention_in_days = var.cloudwatch_log_retention_in_days
  tags              = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "cloudwatch" {
  policy_name     = "${local.stack}-opensearch-log-resource-policy"
  policy_document = data.aws_iam_policy_document.cloudwatch.json
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name        = "${local.stack}-${var.domain_name_suffix}-security-group"
  description = "security group associated with the opensearch cluster named ${local.stack}-${var.domain_name_suffix}"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.stack}-${var.domain_name_suffix}-security-group"
  }
}

resource "aws_security_group_rule" "inbound" {
  count = var.create_security_group ? 1 : 0

  type              = "ingress"
  description       = "allow inbound traffic from the nih network"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.this[0].id
  cidr_blocks       = local.ranges
}

resource "aws_security_group_rule" "outbound" {
  count = var.create_security_group ? 1 : 0

  type              = "egress"
  description       = "allow outbound traffic to all destinations"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.this[0].id
  cidr_blocks       = ["0.0.0.0/0"]
}
