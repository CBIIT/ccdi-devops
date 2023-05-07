resource "aws_securityhub_account" "this" {
  enable_default_standards = false
  auto_enable_controls     = true
}


resource "aws_securityhub_invite_accepter" "this" {
  master_id = var.manager_account_id

  depends_on = [
    aws_securityhub_account.this
  ]
}

resource "aws_securityhub_standards_subscription" "nist" {
  count         = var.enable_nist_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:us-east-1::standards/nist-800-53/v/5.0.0"

  depends_on = [
    aws_securityhub_invite_accepter.this
  ]
}

resource "aws_securityhub_standards_subscription" "foundations" {
  count         = var.enable_foundations_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0"

  depends_on = [
    aws_securityhub_invite_accepter.this
  ]
}

resource "aws_securityhub_standards_subscriptions" "cis" {
  count         = var.enable_cis_standard ? 1 : 0
  standards_arn = "arn:aws:securityhub:us-east-1::standards/cis-aws-foundations-benchmark/v/1.4.0"

  depends_on = [
    aws_securityhub_invite_accepter.this
  ]
}
