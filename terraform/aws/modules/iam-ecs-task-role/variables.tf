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

variable "attach_cloudwatch_policy" {
  type        = bool
  description = "whether to attach the cloudwatch policy to the role"
  default     = false
  sensitive   = false
}

variable "attach_ecs_exec_policy" {
  type        = bool
  description = "whether to attach the ecs exec policy to the role"
  default     = false
  sensitive   = false
}

variable "attach_opensearch_policy" {
  type        = bool
  description = "whether to attach the opensearch policy to the role"
  default     = false
  sensitive   = false
}

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether or not to attach a permissions boundary to the role"
  default     = false
  sensitive   = false
}

variable "attach_secrets_manager_policy" {
  type        = bool
  description = "whether to attach the secrets manager policy to the role"
  default     = false
  sensitive   = false
}

variable "microservice" {
  type        = string
  description = "the name to microservice that this role is attached to (i.e. 'frontend')"
  sensitive   = false
}

