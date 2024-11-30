variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod", "sandbox"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', 'nonprod', and 'sandbox'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos", "fnl"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', 'fnl' and 'ctos'"
  }
}

variable "access_logs_enabled" {
  type        = bool
  description = "whether to enable access logging for the bucket"
  default     = false
  sensitive   = false
}

variable "access_logs_target_bucket" {
  type        = string
  description = "destination bucket name for access logs"
  default     = null
  sensitive   = false
}

variable "access_logs_target_prefix" {
  type        = string
  description = "prefix of the access logs in the destination bucket"
  default     = null
  sensitive   = false
}

variable "access_point_enabled" {
  type        = bool
  description = "whether to create access points for the bucket"
  default     = false
  sensitive   = false
}

variable "access_point_suffix" {
  type        = string
  description = "suffix to append to the access point name to describe its use or allowed principals - required if access_point_enabled is true"
  default     = null
  sensitive   = false
}

variable "access_point_vpc_id" {
  type        = string
  description = "the vpc id from which to allow access to the bucket via the access point - required if access_point_enabled is true"
  default     = null
  sensitive   = false
}

variable "bucket_suffix" {
  type        = string
  description = "suffix to append to the bucket name after the stack name to describe its use"
  sensitive   = false
}

variable "encryption_enabled" {
  type        = bool
  description = "enable s3 object encryption"
  default     = false
  sensitive   = false
}

variable "encryption_deletion_window_in_days" {
  type        = number
  description = "number of days to wait before deleting an encryption key - required if encryption_enabled is true and encryption_sse_algorithm is aws:kms"
  default     = 7
  sensitive   = false
}

variable "encryption_enable_key_rotation" {
  type        = bool
  description = "enable key rotation - required if encryption is true encryption_sse_algorithm is aws:kms"
  default     = false
  sensitive   = false
}

variable "encryption_sse_algorithm" {
  type        = string
  description = "server-side encryption algorithm - required if encryption_enabled is true"
  default     = "AES256"
  sensitive   = false
}

variable "force_destroy" {
  type        = bool
  description = "force terraform to destroy bucket and all objects within bucket"
  default     = false
}

variable "inventory_enabled" {
  type        = bool
  description = "whether to enable inventory configuration for the bucket"
  default     = false
  sensitive   = false
}

variable "inventory_destination_bucket_arn" {
  type        = string
  description = "arn of the bucket to store inventory reports - required if inventory_enabled is true"
  default     = null
  sensitive   = false
}

variable "inventory_destination_format" {
  type        = string
  description = "format of the bucket inventory file ('CSV', 'ORC', or 'Parquet') - required if inventory_enabled is true"
  default     = null
  sensitive   = false
}

variable "inventory_included_object_versions" {
  type        = string
  description = "use 'ALL' to inventory objects and histoical versions or 'CURRENT' for only current versions - required if inventory_enabled is true"
  default     = null
  sensitive   = false
}

variable "inventory_filter_prefix" {
  type        = string
  description = "name of the directory to narrow inventory scope to - required if inventory_enabled is true"
  default     = null
  sensitive   = false
}

variable "inventory_schedule_frequency" {
  type        = string
  description = "frequency in which inventory reports are produced ('Daily' or 'Weekly') - required if inventory_enabled is true"
  default     = null
  sensitive   = false
}

variable "lifecycle_policy_enabled" {
  type        = bool
  description = "whether to enable lifecycle configuration for the bucket"
  default     = false
  sensitive   = false
}

variable "lifecycle_expiration_days" {
  type        = number
  description = "number of days before objects expire - required if lifecycle_policy_enabled is true"
  default     = null
  sensitive   = false
}

variable "lifecycle_noncurrent_expiration_days" {
  type        = number
  description = "number of days before noncurrent object versions expire - required if lifecycle_policy_enabled is true"
  default     = null
  sensitive   = false
}

variable "versioning_enabled" {
  type        = bool
  description = "whether to enable versioning for the bucket"
  default     = false
  sensitive   = false
}

variable "website_configuration_enabled" {
  type        = bool
  description = "whether to enable website configuration for the bucket"
  default     = false
  sensitive   = false
}