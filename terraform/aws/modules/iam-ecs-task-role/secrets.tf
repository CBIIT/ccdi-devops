resource "aws_iam_policy" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-secrets-manager-${var.microservice}"
  description = "enables secrets manager access for the ${var.microservice} service in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.secrets_manager[0].json
}

resource "aws_iam_role_policy_attachment" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.secrets_manager[0].arn
}

data "aws_iam_policy_document" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  statement {
    actions = [ 
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
     ]
  }
}