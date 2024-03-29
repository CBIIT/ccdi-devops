variable "account_id" {
  type      = number
  sensitive = true
}

variable "incident_preference" {
  type        = string
  description = "Roll-up strategy for the alert policy to determine condition-to-incident ratio"
  default     = "PER_CONDITION_AND_TARGET"
  sensitive   = false
}

variable "name" {
  type      = string
  sensitive = false
}