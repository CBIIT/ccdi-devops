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

variable "cookie_behavior" {
  type        = string
  description = "cookie behavior for this cache behavior (allowed values are none, whitelist, all)"
  default     = "none"
  sensitive   = false
}

variable "default_ttl" {
  type        = number
  description = "default time to live in seconds for objects in the cache"
  default     = 86400
  sensitive   = false
}

variable "header_behavior" {
  type        = string
  description = "header behavior for this cache behavior (allowed values are none, whitelist, all)"
  default     = "whitelist"
  sensitive   = false
}

variable "header_items" {
  type        = list(string)
  description = "header items for this cache behavior"
  default = [
    "Origin",
    "Access-Control-Request-Headers",
    "Access-Control-Request-Method"
  ]
  sensitive = false
}

variable "max_ttl" {
  type        = number
  description = "maximum time to live in seconds for objects in the cache"
  default     = 31536000
  sensitive   = false
}

variable "min_ttl" {
  type        = number
  description = "minimum time to live in seconds for objects in the cache"
  default     = 1
  sensitive   = false
}

variable "query_string_behavior" {
  type        = string
  description = "query string behavior for this cache behavior (allowed values are none, whitelist, all)"
  default     = "none"
  sensitive   = false
}
