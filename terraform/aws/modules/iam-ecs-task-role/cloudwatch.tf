resource "aws_iam_policy" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-cloudwatch-${var.microservice}"
  description = "enables cloudwatch logging for the ${var.microservice} service in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.cloudwatch[0].json
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudwatch[0].arn
}


data "aws_iam_policy_document" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*:log-stream:*"
    ]
  }
}
