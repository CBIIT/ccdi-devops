resource "aws_ecr_lifecycle_policy" "this" {
  repository = var.repository_name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "keep last 10 prod images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["prod"],
                "countType": "imageCountMoreThan",
                "countNumber": 10
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "keep latest 30 non prod images",
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