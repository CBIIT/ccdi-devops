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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether or not to attach a permissions boundary to the role"
  default     = false
  sensitive   = false
}

variable "create_manual_snapshot_role" {
  type        = bool
  description = "whether to create a role to enable manual snapshot operations"
  default     = false
}

variable "domain_name_suffix" {
  type        = string
  description = "the domain name suffix that follows the stack name for the opensearch cluster this role is associated with"
  default     = "opensearch"
}

variable "snapshot_bucket_arn" {
  type        = string
  description = "arn of the bucket to store snapshots - required when create_manual_snapshot_role is true"
  default     = "null"
}
