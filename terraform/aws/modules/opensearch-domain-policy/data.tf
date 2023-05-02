data "aws_iam_policy_document" "this" {

  statement {
    effect = "Allow"
    actions = [
      "es:ESHttpPut",
      "es:ESHttpPost",
      "es:ESHttpPatch",
      "es:ESHttpHead",
      "es:ESHttpGet",
      "es:ESHttpDelete"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${var.opensearch_domain_arn}/*"]
  }
}