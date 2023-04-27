locals {
  stack                    = "${var.program}-${var.env}-${var.app}"
  snapshot_name            = "${local.stack}-${random_id.snapshot.hex}"
  permissions_boundary_arn = var.attach_permissions_boundary ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null
  ranges                   = ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
}