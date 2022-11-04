variable "account_id" {
  type      = number
  sensitive = true
}

variable "aggregation_delay" {
  type      = number
  default   = 120
  sensitive = false
}

variable "aggregation_method" {
  type        = string
  description = "Determines when we consider an aggregation window to be complete so that we can evaluate the signal for violations."
  default     = "event_flow"
  sensitive   = false
}

variable "aggregation_window" {
  type        = number
  description = "Time span used to evaluate the query (30-900 seconds)"
  default     = 60
  sensitive   = false
}

variable "close_violations_on_expiration" {
  type      = bool
  default   = true
  sensitive = false
}

variable "critical" {
  type = map(object({
    operator              = string
    threshold             = number
    threshold_duration    = number
    threshold_occurrences = string
    })
  )
  sensitive = false
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

variable "expiration_duration" {
  type        = number
  description = "The amount of time (in seconds) to wait before considering the signal expired"
  default     = 120
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

variable "name" {
  type        = string
  description = "Name of the alert condition"
  sensitive   = false
}

variable "open_violation_on_expiration" {
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

variable "slide_by" {
  type      = number
  default   = 30
  sensitive = false
}

variable "type" {
  type      = string
  default   = "static"
  sensitive = false
}

variable "violation_time_limit_seconds" {
  type        = number
  description = "Time until violations are closed automatically in seconds"
  default     = 3600
  sensitive   = false
}

variable "warning" {
  type = map(object({
    operator              = string
    threshold             = number
    threshold_duration    = number
    threshold_occurrences = string
    })
  )
  sensitive = false
}
