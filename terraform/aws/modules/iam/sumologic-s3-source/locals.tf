locals {
  stack = "${var.program}-${var.env}-${var.app}"
  permissions_boundary_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser"
}