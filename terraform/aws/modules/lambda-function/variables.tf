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

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether to attach a permission boundary to the iam role for lambda"
  default     = false
  sensitive   = false
}

variable "dead_letter_config_target_arn" {
  type        = string
  description = "the arn of the dead letter queue to which lambda will send failed events"
  default     = null
  sensitive   = false
}

variable "description" {
  type        = string
  description = "describe the purpose of the lambda function"
  sensitive   = false
}

variable "ephemeral_storage_size" {
  type        = number
  description = "the amount of ephemeral storage available to the lambda function (MB)"
  default     = 512
  sensitive   = false
}

variable "enable_log_encryption" {
  type        = bool
  description = "whether to enable encryption of logs in cloudwatch with kms"
  default     = true
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
  default     = null
  sensitive   = false
}

variable "handler" {
  type        = string
  description = "the name of the handler function (for example, main.lambda_handler)"
  sensitive   = false
}

variable "layers" {
  type        = list(string)
  description = "optionally provide a list of lambda layer arns to associate with the lambda function"
  default     = []
  sensitive   = false
}

variable "memory_size" {
  type        = number
  description = "the amount of memory available to the lambda function"
  default     = 128
  sensitive   = false
}

variable "publish" {
  type        = bool
  description = "whether to publish the lambda function as a new version"
  default     = false
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

variable "s3_bucket" {
  type        = string
  description = "the name of the s3 bucket that contains the lambda function code"
  default     = null
  sensitive   = false
}

variable "s3_key" {
  type        = string
  description = "the path and name of the file that contains your lambda function code"
  default     = null
  sensitive   = false
}

variable "signing_profile_version_arns" {
  type        = list(string)
  description = "optionally provide a list of signing profile version arns to associate with the lambda function"
  default     = null
  sensitive   = false
}

variable "source_code_hash" {
  type        = string
  description = "the base64-encoded sha256 hash of the package file specified in the filename parameter"
  default     = null
  sensitive   = false
}

variable "timeout" {
  type        = number
  description = "the amount of time that lambda allows a function to run before stopping it"
  default     = 30
  sensitive   = false
}

variable "tracing_mode" {
  type        = string
  description = "the tracing mode for the lambda function - either 'Active' or 'PassThrough'"
  default     = "Active"
  sensitive   = false
}

variable "vpc_config" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  description = "provide a list of security group ids and subnet ids to associate with the lambda function if it is to be deployed in a vpc"
  default     = null
  sensitive   = false
}