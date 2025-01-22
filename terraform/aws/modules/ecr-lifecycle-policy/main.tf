resource "aws_ecr_lifecycle_policy" "this" {
  repository = var.repository_name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "keep last ${var.prod_image_limit} prod images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["prod"],
                "countType": "imageCountMoreThan",
                "countNumber": ${var.prod_image_limit}
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "keep latest ${var.dev_image_limit} non prod images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.dev_image_limit}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
