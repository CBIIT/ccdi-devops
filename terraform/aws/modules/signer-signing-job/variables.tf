variable "ignore_signing_job_failure" {
  type        = bool
  description = "indicates whether the signing job should continue if signature generation fails"
  default     = false
  sensitive   = false
}

variable "profile_name" {
  type        = string
  description = "the name of the signing profile to initiate the signing operation"
  sensitive   = false
}

variable "destination_bucket" {
  type        = string
  description = "the name of the S3 bucket where the signed code should be saved"
  sensitive   = false
}

variable "destination_prefix" {
  type        = string
  description = "the prefix to be used when saving the signed code in the s3 bucket"
  sensitive   = false
}

variable "source_bucket" {
  type        = string
  description = "the name of the S3 bucket where the unsigned code is located"
  sensitive   = false
}

variable "source_key" {
  type        = string
  description = "the key name of the unsigned code object in S3"
  sensitive   = false
}

variable "source_version" {
  type        = string
  description = "the version of the unsigned code object to be signed"
  sensitive   = false
}
