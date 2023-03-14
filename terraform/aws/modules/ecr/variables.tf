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
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "create_lifecycle_policy" {
  type        = bool
  description = "if true, applies a lifecycle policy that only keeps the last 30 images"
  default     = true
  sensitive   = false
}

variable "create_repository_policy" {
  type        = bool
  description = "if true, applies a repository policy that allows access to the repository from specified ecs and jenkins roles"
  default     = false
  sensitive   = false
}

variable "force_delete" {
  type        = bool
  description = "whether to allow terraform to delete a repository, even if contains images"
  default     = false
  sensitive   = false
}

variable "encryption_type" {
  type        = string
  description = "encryption type to use for the repository - either AES256 or KMS - if KMS, must provide arn of the key"
  default     = "AES256"
  sensitive   = false
}

variable "image_name" {
  type        = string
  description = "name of the image, such as 'frontend', 'backend', or 'files'"
  sensitive   = false
}

variable "image_tag_mutability" {
  type        = string
  description = "tag mutability setting for the repository - must be 'MUTABLE' or 'IMMUTABLE'"
  default     = "MUTABLE"
  sensitive   = false
}

variable "is_base_image" {
  type        = bool
  description = "whether the repository is used to manage a base image"
  sensitive   = false
}

variable "kms_key_arn" {
  type        = string
  description = "arn of the kms key used to encrypt images - required if encryption type is KMS"
  default     = null
  sensitive   = false
}

variable "product_family" {
  type        = string
  description = "if is_base_image is true, then provide a product family or archetype (i.e. 'bento')"
  default     = null
  sensitive   = false
}

variable "tags" {
  type        = map(any)
  description = "the map of key value pairs to provide as tags"
  default     = {}
  sensitive   = false
}

variable "repository_policy_principal" {
  type        = set(string)
  description = "arn values for roles allowed to access the repository - only required if create_repository_policy is true"
  default     = []
  sensitive   = false
}
