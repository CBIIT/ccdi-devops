resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-kinesis-firehose-delivery-stream-role"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  description          = "role attached to the kinesis firehose delivery stream resource"
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-kinesis-firehose-delivery-stream-policy"
  description = "allow kinesis firehose delivery stream to send failed messages to s3"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "kinesis_firehose_delivery_stream" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
