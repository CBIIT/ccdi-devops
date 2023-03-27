output "instance_profile_arn" {
  value       = aws_iam_instance_profile.this.arn
  description = "arn of the jenkins instance profile"
  sensitive   = false
}

output "instance_profile_id" {
  value       = aws_iam_instance_profile.this.id
  description = "id of the jenkins instance profile"
  sensitive   = false
}

output "instance_profile_name" {
  value       = aws_iam_instance_profile.this.name
  description = "name of the jenkins instance profile"
  sensitive   = false
}

output "role_arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the jenkins instance profile role"
  sensitive   = false
}

output "role_id" {
  value       = aws_iam_role.this.id
  description = "id of the jenkins instance profile role"
  sensitive   = false
}

output "role_name" {
  value       = aws_iam_role.this.name
  description = "name of the jenkins instance profile role"
  sensitive   = false
}
