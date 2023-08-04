locals {
  level = var.env == "prod" || var.env == "stage" ? "prod" : "nonprod"
  stack = "${var.program}-${var.env}-${var.app}"
}