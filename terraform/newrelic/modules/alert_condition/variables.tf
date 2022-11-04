variable "account_id" {
  type      = number
  sensitive = true
}

variable "description" {
  type      = string
  sensitive = false
}

variable "enabled" {
  type      = bool
  default   = true
  sensitive = false
}

variable "policy_id" {
  type      = number
  sensitive = false
}

variable "runbook_url" {
  type      = string
  default   = null
  sensitive = false
}

variable "type" {
  type    = string
  default = "static"
}

variable "violation_time_limit_seconds" {
  type        = number
  description = "Time until violations are closed automatically in seconds"
  default     = 3600
  sensitive   = false
}

variable "fill_option" {
  type        = string
  description = "Which strategy to use when filling gaps in the signal. Possible values are none, last_value or static. If static, the fill_value field will be used for filling gaps in the signal."
  default     = "last_value"
  sensitive   = false
}

variable "fill_value" {
  type      = number
  default   = null
  sensitive = false
}

variable "aggregation_window" {
  type        = number
  description = "Time span used to evaluate the query (30-900 seconds)"
  default     = 60
  sensitive   = false
}