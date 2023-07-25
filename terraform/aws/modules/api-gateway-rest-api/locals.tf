locals {
  level                    = var.env == "prod" || var.env == "stage" ? "prod" : "nonprod"
  permissions_boundary_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser"
  stack                    = "${var.program}-${var.env}-${var.app}"
}