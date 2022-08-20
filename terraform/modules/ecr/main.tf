resource "aws_ecr_repository" "ecr" {
  # checkov:skip=CKV_AWS_136: AES256 encryption used, KMS not necessary
  name                 = "${var.program}-${var.app}-${var.account_level}-${var.repo_type}-repository"
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "ecr" {
  repository = aws_ecr_repository.ecr.name
  policy     = data.aws_iam_policy_document.ecr.json
}

resource "aws_ecr_lifecycle_policy" "ecr" {
  repository = aws_ecr_repository.ecr.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep the last 15 images"

      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 15
      }

      action = {
        type = "expire"
      }
    }]
  })
}
