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
  description = "description of the rule"
  sensitive   = false
}

variable "enable" {
  type        = bool
  description = "whether to enable the rule"
  default     = true
  sensitive   = false
}

variable "event_bus_name" {
  type        = string
  description = "name of the event bus to create the rule on"
  default     = "default"
  sensitive   = false
}

variable "event_pattern" {
  type        = any
  description = "event pattern for the rule"
  default     = null
  sensitive   = false
}

variable "role_arn" {
  type        = string
  description = "arn of the role to use for the rule to support target invocation"
  default     = null
  sensitive   = false
}

variable "rule_suffix" {
  type        = string
  description = "suffix to append to the rule name after the stack name"
  sensitive   = false
}

variable "schedule_expression" {
  type        = string
  description = "schedule expression (cron) for the rule"
  default     = null
  sensitive   = false
}

variable "trigger_type" {
  type        = string
  description = "type of trigger for the rule - either 'schedule or 'event_pattern'"
  default     = "event_pattern"
  sensitive   = false

  validation {
    condition     = contains(["schedule", "event_pattern"], var.trigger_type)
    error_message = "valid values for trigger_type are 'schedule' and 'event_pattern'"
  }
}
