resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-${var.domain_name_suffix}-role"
  description          = "role to enable creation of opensearch and routine opensearch operations"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary
}

resource "aws_iam_policy" "service-linked-role-policy" {
  name        = "power-user-${local.stack}-${var.domain_name_suffix}-service-linked-role-policy"
  description = "policy to enable creation of opensearch and routine opensearch operations"
  policy      = data.aws_iam_policy_document.service_linked_role_policy.json
}

resource "aws_iam_role_policy_attachment" "service_linked_role_policy" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.service_linked_role_policy.arn
}

resource "aws_iam_policy" "snapshot" {
  count = var.create_manual_snapshot_role ? 1 : 0

  name        = "power-user-${local.stack}-${var.domain_name_suffix}-manual-snapshot-policy"
  description = "policy to enable opensearch manual snapshot operations"
  policy      = data.aws_iam_policy_document.snapshot[0].json
}

resource "aws_iam_role_policy_attachment" "snapshot" {
  count = var.create_manual_snapshot_role ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.snapshot[0].arn
}
