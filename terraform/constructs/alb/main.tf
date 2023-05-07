module "alb" {
  source = "../../modules/alb/"

  access_logs_bucket          = var.access_logs_bucket
  app                         = var.app
  enable_deletion_protection  = var.enable_deletion_protection
  env                         = var.env
  internal                    = var.internal
  program                     = var.program
  security_group_id           = var.security_group_id
  subnets                     = var.subnets
}
