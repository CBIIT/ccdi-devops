variable "description" {
  type        = string
  description = "description of the code signing config"
  default     = null
  sensitive   = false
}

variable "signing_profile_version_arns" {
  type        = list(string)
  description = "list of signing profile version arns to allow"
  default     = []
  sensitive   = false
}

variable "untrusted_artifact_on_deployment" {
  type        = string
  description = "whether to allow untrusted artifacts to be deployed - either 'Warn' or 'Enforce'"
  default     = "Enforce"
  sensitive   = false
}
