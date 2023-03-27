variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether to attach permissions boundary to jenkins instance profile role"
  default     = true
  sensitive   = false
}

variable "enable_ecr_access" {
  type        = bool
  description = "allow jenkins to pull and push from specified ecr repositories"
  sensitive   = false
}

variable "ecr_repository_arns" {
  type        = list(string)
  description = "list of ecr repository arns to allow jenkins to pull and push from"
  default     = []
  sensitive   = false
}

variable "enable_ecs_access" {
  type        = bool
  description = "allow jenkins to access specified ecs clusters to perform deployment operations"
  default     = false
  sensitive   = false
}

variable "enable_secrets_manager_access" {
  type        = bool
  description = "allow jenkins to read from specified secrets manager secrets"
  default     = false
  sensitive   = false
}

variable "secrets_manager_secret_arns" {
  type        = list(string)
  description = "list of secrets manager secret arns to allow jenkins to read from"
  default     = []
  sensitive   = false
}

variable "enable_s3_access" {
  type        = bool
  description = "allow jenkins to read from specified s3 buckets"
  default     = false
  sensitive   = false
}

variable "s3_bucket_arns" {
  type        = list(string)
  description = "list of s3 bucket arns to allow jenkins to read from"
  default     = []
  sensitive   = false
}

variable "enable_opensearch_access" {
  type        = bool
  description = "allow jenkins to perform etl activities on specified opensearch clusters"
  sensitive   = false
}

variable "opensearch_domain_arns" {
  type        = list(string)
  description = "list of opensearch domain arns to allow jenkins to perform etl activities on"
  default     = []
  sensitive   = false
}