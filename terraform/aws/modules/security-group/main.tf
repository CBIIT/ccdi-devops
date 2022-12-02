resource "aws_security_group" "this" {
  name                   = "${local.stack}-${var.resource}"
  description            = var.description
  revoke_rules_on_delete = var.revoke_rules_on_delete
  vpc_id                 = var.vpc_id

  tags = {
    "Name" = "${local.stack}"
  }
}

