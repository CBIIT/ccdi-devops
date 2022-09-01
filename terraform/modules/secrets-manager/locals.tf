locals {
  app                   = "ins"
  secret_manager_name   = "${var.program}-${var.app}-creds-${var.tier}"
}