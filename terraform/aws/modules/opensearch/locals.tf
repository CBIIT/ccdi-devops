locals {
  stack              = "${var.program}-${var.env}-${var.app}"
  ranges             = ["129.43.0.0/16", "137.187.0.0/16", "10.128.0.0/9", "165.112.0.0/16", "156.40.0.0/16", "10.208.0.0/21", "128.231.0.0/16", "130.14.0.0/16", "157.98.0.0/16", "10.133.0.0/16"]
  security_group_id  = var.create_security_group ? aws_security_group.this[0].id : "n/a"
  security_group_arn = var.create_security_group ? aws_security_group.this[0].arn : "n/a"
}
