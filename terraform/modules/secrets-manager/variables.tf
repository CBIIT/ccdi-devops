variable "secrets" {
  description = "Map of secrets to keep in AWS Secrets Manager"
  type        = map(string)
  default     = {}
}

variable "app" {
  description = "The name of the stack or application for this deployment"
  type        = string
}

variable "tier" {
  type        = string
  description = "The target tier that the secret(s) will be deployed into"
}

variable "program" {
  description = "The name of the program"
  type        = string
}
