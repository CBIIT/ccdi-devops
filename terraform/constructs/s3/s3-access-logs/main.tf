module "s3" {
  source = "../../module/s3/"

  program     = var.program
  app         = var.app
  level       = var.level
  bucket_name = "central-log-destination-bucket"
}

