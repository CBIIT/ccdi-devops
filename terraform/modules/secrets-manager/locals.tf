locals {
  app                   = "ins"
  secret_manager_name   = "${var.program}-${var.app}-credentials-${var.tier}"
}