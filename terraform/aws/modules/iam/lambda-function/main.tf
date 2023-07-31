resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-lambda-${var.function_name}"
  description          = "the role for the lambda function named ${local.stack}-${var.function_name}"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = var.attach_permissions_boundary ? local.permissions_boundary_arn : null
}

####################################################################################################
# CloudWatch Permissions ###########################################################################
####################################################################################################

resource "aws_iam_policy" "cloudwatch" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-cloudwatch"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to write to cloudwatch logs"
  policy      = data.aws_iam_policy_document.cloudwatch.json
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudwatch.arn
}

####################################################################################################
# X-Ray Permissions ################################################################################
####################################################################################################

resource "aws_iam_policy" "xray" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-xray"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to write to xray"
  policy      = data.aws_iam_policy_document.xray.json
}

resource "aws_iam_role_policy_attachment" "xray" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.xray.arn
}

####################################################################################################
# X-Ray Permissions ################################################################################
####################################################################################################

resource "aws_iam_policy" "vpc" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-vpc"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to access the vpc"
  policy      = data.aws_iam_policy_document.vpc.json
}

resource "aws_iam_role_policy_attachment" "vpc" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.vpc.arn
}
