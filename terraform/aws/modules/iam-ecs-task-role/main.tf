resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-task-role-${var.microservice}"
  description          = "ecs task role for ${var.microservice} in the ${var.env} tier"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-task-policy-${var.microservice}"
  description = "ecs task policy for ${var.microservice} in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
