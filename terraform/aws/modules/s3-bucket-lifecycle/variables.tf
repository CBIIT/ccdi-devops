variable "bucket_id" {
  type        = string
  description = "bucket id to apply lifecycle configuration"
  sensitive   = false
}

variable "expiration_days" {
  type        = number
  description = "number of days before objects expire"
  default     = null
  sensitive   = false
}

variable "filter_prefix" {
  type        = string
  description = "prefix to filter objects"
  default     = null
  sensitive   = false
}

variable "noncurrent_expiration_days" {
  type        = number
  description = "number of days before noncurrent object versions expire"
  default     = null
  sensitive   = false
}
