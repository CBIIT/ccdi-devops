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
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
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

variable "access_point_suffix" {
  type        = string
  description = "suffix to append to the access point name to describe its use or allowed principals - required if create_access_point is true"
  default = "null"
  sensitive   = false
}

variable "access_point_vpc_id" {
    type        = string
  description = "the vpc id from which to allow access to the bucket via the access point - required if create_access_point is true"
  default = null
  sensitive   = false
}

variable "bucket_suffix" {
  type        = string
  description = ""
}

variable "create_access_point" {
  type        = bool
  description = "whether to create access points for the bucket"
  default     = false
}

variable "enable_access_logging" {
  type        = bool
  description = "whether to enable access logging for the bucket"
  default     = false
}

variable "enable_bucket_inventory" {
  type        = bool
  description = "whether to enable s3 bucket inventory feature"
  default     = false
}

variable "enable_object_expiration" {
  type        = bool
  description = "whether to expire objects after 90 days with lifecycle rules"
  default     = false
}

variable "enable_object_versioning" {
  type        = bool
  description = "whether to enable versioning for objects in the bucket"
  default     = true
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

variable "expire_objects_after_days" {
  type        = number
  description = "required if expire_objects is true - number of days to retain objects in the bucket"
  default     = 90
}

variable "force_destroy" {
  type        = bool
  description = "force terraform to destroy bucket and all objects within bucket"
  default     = false
}

variable "inventory_included_object_versions" {
  type        = string
  description = "use 'ALL' to inventory objects and histoical versions or 'CURRENT' for only current versions"
  default     = null
}

variable "inventory_filter_prefix" {
  type        = string
  description = "name of the directory to narrow inventory scope to"
  default     = null
}

variable "inventory_schedule_frequency" {
  type        = string
  description = "Daily or Weekly"
  default     = null
}

variable "inventory_destination_bucket_arn" {
  type        = string
  description = ""
  default     = null
}

variable "inventory_destination_format" {
  type        = string
  description = "format of the bucket inventory file - can be 'CSV', 'ORC', or 'Parquet'"
  default     = null
}

variable "logging_target_bucket" {
  type        = string
  description = "destination bucket name for access logs"
  default     = null
}

variable "logging_target_prefix" {
  type        = string
  description = "prefix of the access logs in the destination bucket"
  default     = null
}

