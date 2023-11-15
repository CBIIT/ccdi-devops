variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod", "sandbox"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', 'nonprod', and 'sandbox'"
  }
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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether or not to attach the permissions boundary to the role"
  default     = true
  sensitive   = false
}

variable "s3_bucket_arn" {
  type        = string
  description = "the arn of the s3 bucket to be used for opensearch snapshot repository"
  sensitive   = false
}