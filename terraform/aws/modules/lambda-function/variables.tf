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
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
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

variable "architectures" {
  type        = string
  description = "the architectures supported by the lambda function"
  default     = "x86_64"
  sensitive   = false

  validation {
    condition     = contains(["x86_64", "arm64"], var.architectures)
    error_message = "valid values for architectures are 'x86_64' and 'arm64'"
  }
}

variable "description" {
  type        = string
  description = "describe the purpose of the lambda function"
  sensitive   = false
}

variable "environment_variables" {
  type        = map(string)
  description = "provide a map of key-value pairs to be used as environment variables for the lambda function"
  default     = {}
  sensitive   = false
}

variable "function_name" {
  type        = string
  description = "provide a name for the lambda function that will be appended to the stack name"
  sensitive   = false
}

variable "filename" {
  type        = string
  description = "provide the path and name of the file that contains your lambda function code"
  sensitive   = false
}

variable "handler" {
  type        = string
  description = "the name of the handler function (for example, main.lambda_handler)"
  sensitive   = false
}

variable "memory_size" {
  type        = number
  description = "the amount of memory available to the lambda function"
  default     = 128
  sensitive   = false
}

variable "role" {
  type        = string
  description = "provide the role that provides permission for the lambda function to access aws services and resources"
  sensitive   = false
}

variable "runtime" {
  type        = string
  description = "the language-specific environment specified in the runtime parameter"
  sensitive   = false

  validation {
    condition     = contains(["nodejs18.x", "nodejs16.x", "nodejs14.x", "python3.10", "python3.9", "python3.8", "python3.7", "java17", "java11"], var.runtime)
    error_message = "valid values for runtime are 'nodejs18.x', 'nodejs16.x', 'nodejs14.x', 'python3.10', 'python3.9', 'python3.8', 'python3.7', 'java17', 'java11'"
  }
}

variable "security_group_ids" {
  type        = list(string)
  description = "optionally provide a list of security group ids to associate with the lambda function"
  default     = []
  sensitive   = false
}

variable "source_code_hash" {
  type        = string
  description = "the base64-encoded sha256 hash of the package file specified in the filename parameter"
  sensitive   = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "optionally provide a list of subnet ids to associate with the lambda function"
  default     = []
  sensitive   = false
}

variable "timeout" {
  type        = number
  description = "the amount of time that lambda allows a function to run before stopping it"
  default     = 30
  sensitive   = false
}
