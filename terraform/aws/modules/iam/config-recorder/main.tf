resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-config-role"
  description          = "config role for ${local.stack}"
  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-config-role-policy"
  description = "config role policy for ${local.stack}"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "aws_managed" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}