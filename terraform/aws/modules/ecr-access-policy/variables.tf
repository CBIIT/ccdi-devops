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

variable "nonprod_account_id" {
  type        = string
  description = "the nonprod project account id"
  sensitive   = true
}

variable "prod_account_id" {
  type        = string
  description = "the prod project account id"
  sensitive   = true
}

variable "repository_name" {
  type        = string
  description = "the name of the ecr repository to associate the repository resource policy with"
  sensitive   = false
}

variable "access_policy_type" {
  type        = string
  description = "access policy type is to define what kind of policy to apply either standard, alternate or none"
  default     = "standard"

  validation {
    condition     = var.my_variable == "standard" || var.my_variable == "alternate" || var.my_variable == "none"
    error_message = "Invalid value for access_policy_type. Allowed options are: standard, alternate, none."
  }
}
