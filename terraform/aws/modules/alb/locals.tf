locals {
  stack = "${var.program}-${var.env}-${var.app}"
  security_group_arn = var.create_security_group ? aws_security_group.this[0].arn : null
  security_group_id  = var.create_security_group ? aws_security_group.this[0].id : null
}