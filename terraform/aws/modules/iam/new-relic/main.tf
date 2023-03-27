resource "aws_iam_role" "new_relic_read_only" {
  name                  = "${local.stack_iam}-new-relic-read-only-role"
  assume_role_policy    = data.aws_iam_policy_document.trust.json
  description           = "allow new relic to retrieve observability data from cloudwatch"
  force_detach_policies = false
  permissions_boundary  = local.permissions_boundary
}

resource "aws_iam_role_policy_attachment" "new_relic_read_only" {
  role       = aws_iam_role.new_relic_read_only[0].name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
