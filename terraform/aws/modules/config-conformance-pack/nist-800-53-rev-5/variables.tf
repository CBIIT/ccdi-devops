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

variable "config_s3_bucket_name" {
  type        = string
  description = "name of the s3 bucket to store the config conformance pack template - required if create_config_s3_bucket is false"
  default     = null
  sensitive   = false
}

variable "create_config_s3_bucket" {
  type        = bool
  description = "whether or not to create an s3 bucket to store the config conformance pack template"
  default     = true
  sensitive   = false
}