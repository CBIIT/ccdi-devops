##################################
#  Required Variables ############
##################################

variable "program" {
  type        = string
  description = "Provide the name of the program this app or project supports (i.e. ccdi)"
}

variable "app" {
  type        = string
  description = "Provide the name of the app or project that this bucket supports"
}

variable "level" {
  type        = string
  description = "Specify the tier or the account-level. Tiers examples include dev, qa while account-levels are prod and nonprod"
}

variable "bucket_name" {
  type        = string
  description = "The suffix for the name of the bucket. Use it to describe the purpose of the bucket"
}

##################################
#  Optional Variables ############
##################################

variable "block_public_acls" {
  type        = bool
  description = "Whether S3 should block public ACLs for this bucket"
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "Whether S3 should block public bucket policies for this bucket"
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether S3 should ignore public ACLs for this bucket"
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether S3 should restrict public bucket policies for this bucket"
  default     = true
}

variable "version_configuration_status" {
  type        = string
  description = "The versioning state of the bucket. Can be 'Enabled', 'Disabled', or 'Suspended'"
  default     = "Enabled"
}
