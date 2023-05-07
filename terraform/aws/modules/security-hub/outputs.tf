output "id" {
  value = aws_securityhub_account.this.id
  description = "id of the account where security hub was implemented"
  sensitive = true
}

output "arn" {
  value = aws_securityhub_account.this.arn
  description = "arn of the implementation of security hub"
  sensitive = false
}