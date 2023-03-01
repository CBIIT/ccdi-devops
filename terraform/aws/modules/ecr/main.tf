resource "aws_ecr_repository" "this" {
  name                 = local.repository_name
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key_arn
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_repository_policy" "this" {
  repository = aws_ecr_lifecycle_policy.this.name
  policy     = ""
}

resource "aws_ecr_lifecycle_policy" "this" {
  count = var.create_lifecycle_policy ? 1 : 0

  repository = aws_ecr_repository.this.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "keep last 30 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

# DescribeRegistry 
# 

data "aws_iam_policy_document" "base" {
  statement {
    effect    = "Allow"
    principal = [var.task_execution_role_arn, var.jenkins_instance_profile_role_arn]
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:TagResource",
      "ecr:UntagResource"
    ]
    resources = [aws_ecr_repository.this.arn]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    effect    = "Allow"
    principal = [var.task_execution_role_arn, var.jenkins_instance_profile_role_arn]
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
    ]
  }
}