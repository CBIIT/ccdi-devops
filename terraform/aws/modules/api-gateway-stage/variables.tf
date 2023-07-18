variable "access_log_destination_arn" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "access_log_format" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "cache_cluster_enabled" {
  type        = bool
  description = ""
  default     = false
  sensitive   = false
}

variable "cache_cluster_size" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "canary_settings_deployment_id" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "canary_settings_percent_traffic" {
  type        = number
  description = ""
  default     = null
  sensitive   = false
}

variable "canary_settings_stage_variable_overrides" {
  type        = map(string)
  description = ""
  default     = {}
  sensitive   = false
}

variable "client_certificate_id" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "deployment_id" {
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

variable "documentation_version" {
  type        = string
  description = ""
  default     = null
  sensitive   = false
}

variable "rest_api_id" {
  type        = string
  description = ""
  sensitive   = false
}

variable "stage_name" {
  type        = string
  description = ""
  sensitive   = false
}

variable "variables" {
  type        = map(string)
  description = ""
  default     = {}
  sensitive   = false
}

variable "xray_tracing_enabled" {
  type        = bool
  description = ""
  default     = false
  sensitive   = false
}
