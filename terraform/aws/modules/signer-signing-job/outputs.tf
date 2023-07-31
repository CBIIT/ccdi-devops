output "completed_at" {
  value       = aws_signer_signing_job.this.completed_at
  description = "date and time that the signing job was completed"
  sensitive   = false
}

output "created_at" {
  value       = aws_signer_signing_job.this.created_at
  description = "date and time that the signing job was created"
  sensitive   = false
}

output "job_id" {
  value       = aws_signer_signing_job.this.job_id
  description = "the id of the signing job"
  sensitive   = false
}

output "job_invoker" {
  value       = aws_signer_signing_job.this.job_invoker
  description = "the iam principal that requested the signing job"
  sensitive   = false
}

output "job_owner" {
  value       = aws_signer_signing_job.this.job_owner
  description = "the iam principal that owns the signing job"
  sensitive   = false
}

output "platform_display_name" {
  value       = aws_signer_signing_job.this.platform_display_name
  description = "the display name of the signing platform"
  sensitive   = false
}

output "platform_version" {
  value       = aws_signer_signing_job.this.platform_version
  description = "the version of the signing platform"
  sensitive   = false
}

output "requested_by" {
  value       = aws_signer_signing_job.this.requested_by
  description = "the iam principal that requested the signing job"
  sensitive   = false
}

output "revocation_record" {
  value       = aws_signer_signing_job.this.revocation_record
  description = "the revocation record for the signing job"
  sensitive   = false
}

output "signature_expires_at" {
  value       = aws_signer_signing_job.this.signature_expires_at
  description = "the date and time that the signing job signature expires"
  sensitive   = false
}

output "signed_object" {
  value       = aws_signer_signing_job.this.signed_object
  description = "name of the s3 bucket where the signed code is located"
  sensitive   = false
}

output "status" {
  value       = aws_signer_signing_job.this.status
  description = "status of the signing job"
  sensitive   = false
}

output "status_reason" {
  value       = aws_signer_signing_job.this.status_reason
  description = "status reason of the signing job"
  sensitive   = false
}
