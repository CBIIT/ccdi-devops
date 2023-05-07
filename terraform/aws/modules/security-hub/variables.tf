variable "enable_cis_standard" {
  type        = bool
  description = "enable the cis aws foundations benchmark standard in security hub"
  default     = false
  sensitive   = false
}

variable "enable_foundations_standard" {
  type        = bool
  description = "enable the aws foundational security best practices standard in security hub"
  default     = false
  sensitive   = false
}

variable "enable_nist_standard" {
  type        = bool
  description = "enable the nist 800-53 standard in security hub"
  default     = true
  sensitive   = false
}

variable "manager_account_id" {
  type        = string
  description = "the aws account id of the fnl manager account"
  sensitive   = true
}
