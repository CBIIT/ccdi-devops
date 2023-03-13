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

variable "firehose_arn" {
  type        = string
  description = "arn of the kinesis firehose delivery stream to use for the metric stream"
  sensitive   = false
}

variable "include_filter" {
  type        = set(string)
  description = "Specify the service namespaces to include in metric stream in a list"
  default     = ["AWS/ES", "AWS/ApplicationELB", "AWS/ECS"]
  sensitive   = false
}

variable "output_format" {
  type        = string
  description = "output format of the metric stream data - either 'json' or 'opentelemetry0.7'"
  default     = "opentelemetry0.7"
  sensitive   = false
}

variable "resource_suffix" {
  type        = string
  description = "a suffix to append to the resource name after the stack name"
  sensitive   = false
}

variable "role_arn" {
  type        = string
  description = "arn of the role for cloudwatch metric stream to assume"
  sensitive   = false
}
