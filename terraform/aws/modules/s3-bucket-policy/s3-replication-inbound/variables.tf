variable "bucket_id" {
  type        = string
  description = "id of the S3 bucket to attach the policy to"
  sensitive   = false
}

variable "source_replication_role_arn" {
  type        = string
  description = "ARN of the IAM role that the source bucket uses to replicate objects"
  sensitive   = false
}
