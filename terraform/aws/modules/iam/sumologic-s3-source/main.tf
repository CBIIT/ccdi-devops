#################################################################################################################################
# SumoLogic Role that provides read-only access to collect events from specified S3 Buckets  ####################################
#################################################################################################################################

resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-sumologic-read-only"
  description          = "sumologic role that provides read-only access to collect events from specified s3 buckets"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

#################################################################################################################################
# SumoLogic Role that provides read-only access to collect events from specified S3 Buckets  ####################################
#################################################################################################################################

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-sumologic-read-only"
  description = "sumologic policy that provides read-only access to collect events from specified s3 buckets"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "name" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}