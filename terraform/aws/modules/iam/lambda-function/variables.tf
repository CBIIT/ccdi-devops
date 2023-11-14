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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether or not to attach the permission boundary to the role"
  default     = true
  sensitive   = false

}

variable "enable_vpc_access" {
  type        = bool
  description = "whether or not to enable vpc access for the lambda function"
  default     = false
  sensitive   = false
}

variable "function_name" {
  type        = string
  description = "the name of the lambda function that is appended to the stack name"
  sensitive   = false
}
