output "bucket" {
  value       = aws_s3_bucket_policy.this.bucket
  description = "the name of the bucket to which the policy applies"
}

output "id" {
  value       = aws_s3_bucket_policy.this.id
  description = "the name or id of the policy"
}

output "policy" {
  value       = aws_s3_bucket_policy.this.policy
  description = "the policy document as a JSON formatted string"
}
