locals {
  stack    = "${var.program}-${var.env}-${var.app}-${var.platform}"
  platform = var.platform == "lambda" ? "AWSLambda-SHA384-ECDSA" : "Notation-OCI-SHA384-ECDSA"
}