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

variable "create_access_policy" {
  type        = bool
  description = "whether to create an access policy for the ecr repository with default permissions"
  default     = true
  sensitive   = false
}

variable "create_lifecycle_policy" {
  type        = bool
  description = "whether to create a lifecycle policy for the ecr repository with standard expiration rules"
  default     = true
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

variable "force_delete" {
  type        = bool
  description = "whether to allow terraform to delete a repository, even if contains images"
  default     = false
  sensitive   = false
}

variable "image_tag_mutability" {
  type        = string
  description = "tag mutability setting for the repository - must be 'MUTABLE' or 'IMMUTABLE'"
  default     = "IMMUTABLE"
  sensitive   = false
}

variable "microservice" {
  type        = string
  description = "name of the image, such as 'frontend', 'backend', or 'files'"
  sensitive   = false
}

variable "nonprod_account_id" {
  type        = string
  description = "the nonprod project account id - required if create_access_policy is true"
  default     = null
  sensitive   = true
}

variable "prod_account_id" {
  type        = string
  description = "the prod project account id - required if create_access_policy is true"
  default     = null
  sensitive   = true
}