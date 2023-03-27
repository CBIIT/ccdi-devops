resource "aws_iam_policy" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecs"
  description = ""
  policy      = data.aws_iam_policy_document.ecs[0].json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs[0].arn
}

data "aws_iam_policy_document" "ecs" {
  count = var.enable_ecs_access ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = []
    resources = []
  }

  statement {
    effect    = "Allow"
    actions   = []
    resources = []
  }
}

variable "enable_ecs_access" {
  type        = bool
  description = "allow jenkins to access specified ecs clusters to perform deployment operations"
  default     = false
  sensitive   = false
}