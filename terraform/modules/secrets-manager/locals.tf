locals {
  app                   = "ins"
  secret_manager_name   = "${var.app}-credentials-${var.tier}"
}