resource "aws_ecr_repository" "this" {
  name                 = local.repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    program        = var.program
    app            = var.app
    microservice   = var.microservice
    tpm_email      = var.tpm_email
    tpm_first_name = var.tpm_first_name
    tpm_last_name  = var.tpm_last_name
  }
}

module "lifecycle_policy" {
  count  = var.create_lifecycle_policy ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-lifecycle-policy"

  repository_name = aws_ecr_repository.this.name
}

module "access_policy" {
  count = var.create_access_policy ? 1 : 0

  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-access-policy"

  app                = var.app
  nonprod_account_id = var.nonprod_account_id
  prod_account_id    = var.prod_account_id
  program            = var.program
  repository_name    = aws_ecr_repository.this.name
  access_policy_type = var.access_policy_type
}
