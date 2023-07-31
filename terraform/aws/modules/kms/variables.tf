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

variable "description" {
  type        = string
  description = "description of how the key will be used"
  sensitive   = false
}

variable "deletion_window_in_days" {
  type        = number
  description = "duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days"
  default     = 0
  sensitive   = false
}

variable "enable_key_rotation" {
  type        = bool
  description = "whether to enable automatic rotation of the key"
  default     = true
  sensitive   = false
}

variable "kms_suffix" {
  type        = string
  description = "suffix to append to the kms alias"
  sensitive   = false
}
