locals {
  stack                    = "${var.program}-${var.env}-${var.app}"
  permissions_boundary_arn = var.attach_permissions_boundary ? "arn:aws:iam::${var.account_id}:policy/PermissionBoundary_PowerUser" : null
}