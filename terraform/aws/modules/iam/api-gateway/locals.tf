locals {
  level                    = terraform.workspace == "dev" || terraform.workspace == "qa" ? "nonprod" : "prod"
  stack                    = "${var.program}-${var.env}-${var.app}"
  permissions_boundary_arn = var.attach_permissions_boundary ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null
}
