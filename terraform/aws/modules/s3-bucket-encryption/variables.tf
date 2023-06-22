variable "bucket_id" {
  type        = string
  description = "the id of the bucket to apply encryption to"
  sensitive   = false
}

variable "deletion_window_in_days" {
  type        = number
  description = "The duration in days after which the key is deleted after destruction of the resource - required if ss3_algorithm is 'aws:kms'"
  default     = 7
  sensitive   = false
}

variable "enable_key_rotation" {
  type        = bool
  description = "Specifies whether key rotation is enabled - required if ss3_algorithm is 'aws:kms'"
  default     = true
  sensitive   = false
}

variable "sse_algorithm" {
  type        = string
  description = "the server-side encryption algorithm to use - either 'AES256' and 'aws:kms'"
  default     = "AES256"
  sensitive   = false

  validation {
    condition     = contains(["aws:kms", "AES256"], var.ss3_algorithm)
    error_message = "valid values for the server side encyption algorythm are 'AES256' and 'aws:kms'"
  }
}
