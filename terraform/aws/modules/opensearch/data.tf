data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "domain_policy" {
  count = var.create_domain_policy ? 1 : 0

  statement {
    effect  = "Allow"
    actions = var.domain_policy_actions
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_opensearch_domain.this.arn}/*"]
  }
}

data "aws_iam_policy_document" "cloudwatch" {
  statement {
    actions = [
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
      "logs:CreateLogStream"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.index_slow.name}",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.search_slow.name}",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.error.name}",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.index_slow.name}:log-stream:*",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.search_slow.name}:log-stream:*",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:${aws_cloudwatch_log_group.error.name}:log-stream:*",
    ]
    principals {
      type = "Service"
      identifiers = [
        "es.amazonaws.com",
        "opensearch.amazonaws.com"
      ]
    }
  }
}
