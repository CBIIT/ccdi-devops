output "policy" {
  value       = data.aws_iam_policy_document.this.json
  description = "standard json policy document rendered based on the module inputs"
  sensitive   = false
}
