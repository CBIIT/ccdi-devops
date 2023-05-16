variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos", "fnl"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', 'fnl' and 'ctos'"
  }
}

variable "alias" {
  type        = string
  description = "the alias for the kms key"
  sensitive   = false
}

variable "customer_master_key_spec" {
  type        = string
  description = "whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports"
  default     = "SYMMETRIC_DEFAULT"
  sensitive   = false
}

variable "deletion_window_in_days" {
  type        = number
  description = "days before the key is permanently deleted after destruction of the resource"
  default     = 7
  sensitive   = false
}
