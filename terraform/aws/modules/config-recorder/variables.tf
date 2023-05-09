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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether or not to attach a permissions boundary to the role created for the config service"
  sensitive   = false
}

variable "config_s3_bucket_name" {
  type        = string
  description = "the name of the s3 bucket to store aws config data"
  sensitive   = false
}

variable "enable_config" {
  type        = bool
  description = "whether to enable aws config"
  default     = true
  sensitive   = false
}

variable "manager_account_id" {
  type        = string
  description = "the manager account id to authorize aggregation"
  sensitive   = false
}
