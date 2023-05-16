resource "aws_ecr_repository_policy" "this" {
  repository = var.repository_name
  policy     = data.aws_iam_policy_document.this.json
}
