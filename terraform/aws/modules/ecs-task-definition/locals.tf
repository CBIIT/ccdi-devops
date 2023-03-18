locals {
  stack                    = "${var.program}-${var.env}-${var.app}"
  permissions_boundary_arn = terraform.workspace == "dev" || terraform.workspace == "qa" ? "arn:aws:iam::${var.account_id}:policy/PermissionBoundary_PowerUser" : null
}
