resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-task-role-${var.microservice}"
  description          = "ecs task role for ${var.microservice} in the ${var.env} tier"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

