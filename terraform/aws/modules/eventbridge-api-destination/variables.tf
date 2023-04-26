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

variable "api_key_name" {
  type        = string
  description = "api key name for api destination"
  default     = "Api-Key"
  sensitive   = false
}

variable "api_key_value" {
  type        = string
  description = "api key value for api destination"
  sensitive   = true
}

variable "destination_endpoint" {
  type        = string
  description = "destination endpoint for api destination"
  sensitive   = false
}

variable "http_method" {
  type        = string
  description = "http method for api destination"
  default     = "POST"
  sensitive   = false
}

variable "invocation_rate_limit_per_second" {
  type        = number
  description = "invocation rate limit per second for api destination"
  default     = 300
  sensitive   = false
}