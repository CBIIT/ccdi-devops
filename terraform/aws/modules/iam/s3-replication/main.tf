resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-s3-replication"
  description          = "Role assumed by S3 to support object replication"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "${local.stack}-s3-replication"
  description = "Policy to allow S3 to replicate objects"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
