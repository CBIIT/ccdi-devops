resource "aws_iam_instance_profile" "this" {
  name = "power-user-${local.stack}-jenkins-instance-profile-role"
  role = aws_iam_role.this.name
  tags = var.tags
}

resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-jenkins-instance-profile-role"
  description          = "power user role for jenkins instance profile"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
  tags                 = var.tags
}

resource "aws_iam_policy" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecr"
  description = "allow jenkins to pull and push from specified ecr repositories"
  policy      = data.aws_iam_policy_document.ecr[0].json
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecr[0].arn
}

resource "aws_iam_policy" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecs"
  description = "allow jenkins to access specified ecs clusters to perform deployment operations"
  policy      = data.aws_iam_policy_document.ecs[0].json
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs[0].arn
}

resource "aws_iam_policy" "iam" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-iam"
  description = "allow jenkins to get and pass iam roles required for deployment operations"
  policy      = data.aws_iam_policy_document.iam.json
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "iam" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.iam.arn
}

resource "aws_iam_policy" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-opensearch"
  description = "allow jenkins to perform etl activities on specified opensearch clusters"
  policy      = data.aws_iam_policy_document.opensearch[0].json
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.opensearch[0].arn
}

resource "aws_iam_policy" "s3" {
  count = var.enable_s3_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-s3"
  description = "allow jenkins to read from specified s3 buckets"
  policy      = data.aws_iam_policy_document.s3[0].json
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "s3" {
  count = var.enable_s3_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3[0].arn
}

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