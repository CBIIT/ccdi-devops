variable "kms_key_arn" {
  type        = string
  description = "arn of the kms key used to encrypt the log group"
  default     = null
  sensitive   = false
}

variable "name" {
  type        = string
  description = "name of the log group"
  sensitive   = false
}

variable "retention_in_days" {
  type        = number
  description = "number of days to retain the log events"
  default     = 90
  sensitive   = false
}
