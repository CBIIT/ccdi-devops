data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  statement {
    sid     = "apiGatewayTrustPolicy"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    sid    = "apiGatewayLogPrivileges"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents"
    ]
    resources = [
      "${aws_cloudwatch_log_group.this.arn}",
      "${aws_cloudwatch_log_group.this.arn}:log-stream:*"
      ]
  }
}
