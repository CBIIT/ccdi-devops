module "alb" {
  source = "../../modules/alb/"

  access_logs_bucket = var.access_logs_bucket
  app                = var.app
  env                = var.env
  internal           = var.internal
  program            = var.program
  security_group_id  = var.security_group_id
  subnets            = var.subnets
}
