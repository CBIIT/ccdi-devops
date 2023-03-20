resource "aws_iam_policy" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-opensearch-${var.microservice}"
  description = "enables opensearch access for the ${var.microservice} service in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.opensearch[0].json
}

resource "aws_iam_role_policy_attachment" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.opensearch[0].arn
}

data "aws_iam_policy_document" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "es:ESHttpDelete",
      "es:ESHttpGet",
      "es:ESHttpHead",
      "es:ESHttpPatch",
      "es:ESHttpPost",
      "es:ESHttpPut"
    ]
    resources = ["${var.opensearch_domain_arn}/*"]
  }
}