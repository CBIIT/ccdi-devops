locals {
  app                   = "ins"
  secret_manager_name   = "${var.program}_${var.app}_${var.tier}_creds"
}