resource "aws_iam_role" "this" {
  name                  = "power-user-${local.stack}-opensearch-snapshot"
  assume_role_policy    = data.aws_iam_policy_document.trust.json
  description           = "role that allows the opensearch service to create snapshots stored in s3"
  force_detach_policies = false
  permissions_boundary  = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-opensearch-snapshot"
  description = "role that allows the opensearch service to create snapshots stored in s3"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
