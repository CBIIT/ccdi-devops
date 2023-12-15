locals {
  stack                    = "${var.program}-${var.env}-${var.app}"
  permissions_boundary_arn = var.attach_permissions_boundary ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null
  log_group_arn            = "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/cwsyn*"
}