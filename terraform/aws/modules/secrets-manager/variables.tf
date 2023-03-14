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

variable "description" {
  type        = string
  description = "description of the secret"
  sensitive   = false
}

variable "enable_secret_policy" {
  type        = bool
  description = "whether to provide and attach a secret access policy"
  default     = false
  sensitive   = false
}

variable "enable_secret_rotation" {
  type        = bool
  description = "whether to enable automated secret rotation"
  default     = false
  sensitive   = false
}

variable "recovery_window_in_days" {
  type        = number
  description = "days to wait before deleting the secret - can be 0, or between 7 and 30"
  default     = 0
  sensitive   = false
}

variable "rotation_automatically_after_days" {
  type        = number
  description = "number of days to wait before invoking automated rotation facilitated by lambda"
  default     = null
  sensitive   = false
}

variable "rotation_lambda_arn" {
  type        = string
  description = "arn of the lambda function that can rotate the secret"
  default     = null
  sensitive   = false
}

variable "secret_policy" {
  type        = string
  description = "provide an optional access policy for the secret"
  default     = null
  sensitive   = false
}

variable "secret_string" {
  type        = map(any)
  description = "provide the map of key value pairs as the secret value - the module encodes the argument as json"
  sensitive   = true
}

variable "secret_suffix" {
  type        = string
  description = "provide a suffix to append to the secret name after the stack name"
  sensitive   = false
}
