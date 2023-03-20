resource "aws_iam_policy" "ecr" {
  name        = "power-user-${local.stack}-task-policy-ecr-${var.microservice}"
  description = "enables ecr access for the ${var.microservice} service in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.ecr[0].json
}
  
resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecr.arn
}

data "aws_iam_policy_document" "ecr" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
}