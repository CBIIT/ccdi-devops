variable "app" {
  type        = string
  description = "name of the application"
}

variable "environment" {
  type        = string
  description = "the tier or account level"
}

variable "program" {
  type        = string
  description = "abbreviation of the ctos program"
}

variable "container_insights_enabled" {
  type        = string
  description = "Enables ECS container insights. Valid values are 'enabled' and 'disabled'"
  default     = "disabled"
}
