output "arn" {
  value       = aws_signer_signing_profile.this.arn
  description = "arn of the signing profile"
  sensitive   = false
}

output "name" {
  value       = aws_signer_signing_profile.this.name
  description = "name of the signing profile"
  sensitive   = false

}

output "platform_display_name" {
  value       = aws_signer_signing_profile.this.platform_display_name
  description = "platform display name of the signing profile"
  sensitive   = false
}

output "revocation_record" {
  value       = aws_signer_signing_profile.this.revocation_record
  description = "revocation record of the signing profile"
  sensitive   = false
}

output "status" {
  value       = aws_signer_signing_profile.this.status
  description = "status of the signing profile"
  sensitive   = false
}

output "version" {
  value       = aws_signer_signing_profile.this.version
  description = "version of the signing profile"
  sensitive   = false
}

output "version_arn" {
  value       = aws_signer_signing_profile.this.version_arn
  description = "version arn of the signing profile"
  sensitive   = false
}
