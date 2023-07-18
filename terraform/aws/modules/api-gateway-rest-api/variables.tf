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

variable "api_key_source" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "api_suffix" {
  type        = string
  description = ""
  default     = "api"
  sensitive   = false
}

variable "binary_media_types" {
  type        = list(string)
  description = ""
  default     = []
  sensitive   = false
}

variable "body" {
  type        = string
  description = ""
  sensitive   = false
}

variable "description" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "disable_execute_api_endpoint" {
  type        = bool
  description = ""
  default     = false
  sensitive   = false
}

variable "endpoint_configuration_types" {
  type        = list(string)
  description = ""
  default     = []
  sensitive   = false
}

variable "endpoint_configuration_vpc_endpoint_ids" {
  type        = set(string)
  description = ""
  default     = []
  sensitive   = false
}

variable "fail_on_warnings" {
  type        = bool
  description = ""
  default     = false
  sensitive   = false
}

variable "minimum_compression_size" {
  type        = number
  description = ""
  default     = 0
  sensitive   = false
}

variable "parameters" {
  type        = map(string)
  description = ""
  default     = {}
  sensitive   = false
}

variable "put_rest_api_mode" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}
