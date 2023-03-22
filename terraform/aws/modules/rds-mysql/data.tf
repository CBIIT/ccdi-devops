data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  count = var.enable_enhanced_monitoring ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "this" {
  count = var.enable_enhanced_monitoring ? 1 : 0

  statement {
    sid    = "EnableCreationAndManagementOfRDSCloudwatchLogGroups"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:PutRetentionPolicy"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:RDS*"
    ]
  }

  statement {
    sid    = "EnableCreationAndManagementOfRDSCloudwatchLogStreams"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:GetLogEvents"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:RDS*:log-stream:*"
    ]
  }
}

