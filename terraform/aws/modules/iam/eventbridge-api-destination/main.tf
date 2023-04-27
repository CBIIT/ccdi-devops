resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-eventbridge-api-destination-${var.api_destination_name}"
  description          = "allows the eventbridge service to publish events to an api destination"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn

}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-eventbridge-api-destination-${var.api_destination_name}"
  description = "allows the eventbridge service to publish events to an api destination"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}
