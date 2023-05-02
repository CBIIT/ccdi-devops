resource "aws_opensearch_domain_policy" "this" {
  domain_name     = var.opensearch_domain_name
  access_policies = data.aws_iam_policy_document.this.json
}