variable "s3_bucket_arn" {
  type        = string
  description = "arn of the s3 bucket to attach the policy to"
  sensitive   = false
}

variable "s3_bucket_id" {
  type        = string
  description = "id of the s3 bucket to attach the policy to"
  sensitive   = false
}
