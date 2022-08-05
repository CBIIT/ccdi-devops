variable "program" {
  type        = string
  description = "The name of the program that the ALB belongs to"
}

variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "account_level" {
  type        = string
  description = "The level of the account for the repository (non-prod or prod)"
}

variable "repo_type" {
  type = string 
  description = "The repository type, based on images stored (frontend, backend, files, etc.)"
}

variable "image_tag_mutability" {
  type = string 
  description = "The tag mutability setting for the repository. Must be MUTABLE or IMMUTABLE"
  default = "MUTABLE"
}