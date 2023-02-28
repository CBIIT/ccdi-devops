variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
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
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "bucket_policy" {
  type        = string
  description = "required if enable_bucket_policy is true - provide the json document containing the bucket policy"
  default     = null
}

variable "bucket_suffix" {
  type        = string
  description = ""
}

variable "enable_bucket_inventory" {
  type        = bool
  description = "whether to enable s3 bucket inventory feature"
  default     = false
}

variable "enable_bucket_policy" {
  type        = bool
  description = "whether to create a bucket policy resource to enable policies provided to be associated with the bucket"
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

