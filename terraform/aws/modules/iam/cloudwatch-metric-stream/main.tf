resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-cloudwatch-metric-stream-role"
  description          = "allow cloudwatch metric stream to publish payloads to kinesis firehose delivery streams"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-cloudwatch-metric-stream-policy"
  description = "allow cloudwatch metric stream to send metrics to kinesis firehose services"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
