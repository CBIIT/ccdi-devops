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

variable "access_control_allow_credentials" {
  type        = bool
  description = "whether to include the access-control-allow-credentials header in responses"
  default     = false
  sensitive   = false
}

variable "access_control_allow_headers" {
  type        = list(string)
  description = "the headers to allow in the access-control-allow-headers header"
  default     = ["*"]
  sensitive   = false
}

variable "access_control_allow_methods" {
  type        = list(string)
  description = "the methods to allow in the access-control-allow-methods header"
  default     = ["GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  sensitive   = false
}

variable "access_control_allow_origins" {
  type        = list(string)
  description = "the origins to allow in the access-control-allow-origins header"
  default     = ["*"]
  sensitive   = false
}

variable "origin_override" {
  type        = bool
  description = "whether to override the origin's cache-control headers"
  default     = true
  sensitive   = false
}
