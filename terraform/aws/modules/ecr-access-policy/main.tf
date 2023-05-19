resource "aws_ecr_repository_policy" "this" {
  repository = var.repository_name
  policy     = var.access_policy_type == "standard" ? data.aws_iam_policy_document.standard[0].json : data.aws_iam_policy_document.alternate[0].json
}
