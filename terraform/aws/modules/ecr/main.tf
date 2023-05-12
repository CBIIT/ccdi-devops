resource "aws_ecr_repository" "this" {
  name                 = local.repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  encryption_configuration {
    encryption_type = "kms"
    kms_key         = aws_kms_key.this.arn
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    program      = var.program
    app          = var.app
    microservice = var.microservice
  }
}

resource "aws_kms_key" "this" {
  deletion_window_in_days  = var.deletion_window_in_days
  description              = "kms key used to encrypt images in the ${local.repository_name} repository"
  enabled                  = true
  enable_key_rotation      = true
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = var.customer_master_key_spec

  tags = {
    program      = var.program
    app          = var.app
    microservice = var.microservice
    repository   = local.repository_name
  }
}

resource "aws_kms_alias" "this" {
  name          = "alias/ecr-repository-${local.repository_name}"
  target_key_id = aws_kms_key.this.key_id
}

module "lifecycle_policy" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-lifecycle-policy"

  repository_name = aws_ecr_repository.this.name
}

module "access_policy" {
  count = var.create_access_policy ? 1 : 0

  source             = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-access-policy"
  app                = var.app
  nonprod_account_id = var.nonprod_account_id
  prod_account_id    = var.prod_account_id
  program            = var.program
  repository_name    = aws_ecr_repository.this.name
}
