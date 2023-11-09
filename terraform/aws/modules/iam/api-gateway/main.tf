resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-rest-api-gateway-ops"
  description          = "Used for API Gateway operations like writting logs and traces"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.level == "prod" ? null : local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-rest-api-gateway-ops"
  description = "Used for API Gateway operations like writting logs and traces"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
