resource "aws_iam_policy" "secrets" {
  count = var.enable_secrets_manager_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-secrets"
  description = "allow jenkins to read from specified secrets manager secrets"
  policy      = data.aws_iam_policy_document.secrets[0].json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "secrets" {
  count = var.enable_secrets_manager_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.secrets[0].arn
}

data "aws_iam_policy_document" "secrets" {
  count = var.enable_secrets_manager_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:CreateSecret",
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetRandomPassword",
      "secretsmanager:GetSecretValue",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:ListSecrets",
      "secretsmanager:PutSecretValue",
      "secretsmanager:RestoreSecret"
    ]
    resources = var.secrets_manager_secret_arns
  }
}
