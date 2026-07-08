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
  description = "description of the origin access control"
  default     = "restricts the requests that cloudfront can make to your s3 bucket"
  sensitive   = false
}

variable "origin_access_control_origin_type" {
  type        = string
  description = "the type of origin that the origin access control applies to"
  default     = "s3"
  sensitive   = false
}

variable "signing_behavior" {
  type        = string
  description = "the behavior if the origin access control requires a signed url"
  default     = "always"
  sensitive   = false
}

variable "signing_protocol" {
  type        = string
  description = "the protocol that the origin access control requires for signed urls"
  default     = "sigv4"
  sensitive   = false
}
