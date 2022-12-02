variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "app" {
  type        = string
  description = "The name of the app or project that this bucket supports"
}

variable "level" {
  type        = string
  description = "The tier or the account-level. Tiers examples include dev, qa while account-levels are prod and nonprod"
}

variable "iam_prefix" {
  type        = string
  description = "The prefix to provide IAM Roles and Policy resource names"
  default     = "power-user"
}

variable "permission_boundary_arn" {
  type        = string
  description = "The permission boundary arn for the account"
}

variable "service_log_bucket" {
  type        = string
  description = "The S3 bucket for config to publish findings to"
}