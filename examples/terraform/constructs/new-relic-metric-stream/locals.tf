locals {
  app     = "example"
  level   = terraform.workspace == "prod" || terraform.workspace == "stage" ? "prod" : "nonprod"
  program = "demo"
}