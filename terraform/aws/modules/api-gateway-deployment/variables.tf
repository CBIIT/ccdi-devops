variable "description" {
  type        = string
  description = "The description of the api"
  default     = null
  sensitive   = false
}

variable "rest_api_id" {
  type        = string
  description = "The ID of the associated REST API"
  sensitive   = false
}

variable "stage_description" {
  type        = string
  description = "The description of the stage"
  default     = null
  sensitive   = false
}

variable "stage_name" {
  type        = string
  description = "The name of the stage"
  sensitive   = false
}

variable "triggers" {
  type        = map(any)
  description = "A map of triggers to re-deploy the API Gateway"
  default     = null
  sensitive   = false
}

variable "variables" {
  type        = map(any)
  description = "A map of variables to be used for the stage"
  default     = {}
  sensitive   = false
}
