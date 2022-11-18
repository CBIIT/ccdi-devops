locals {
  app                   = "ins"
  secret_manager_name   = "${var.program}-${var.tier}-${var.app}-credentials"
}