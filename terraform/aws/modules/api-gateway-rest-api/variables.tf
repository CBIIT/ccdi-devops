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

variable "api_key_source" {
  type        = string
  description = "the source of the API key for this API Gateway"
  default     = null
  sensitive   = false
}

variable "api_logging_level" {
  type        = string
  description = "The logging level for this API Gateway"
  default     = "INFO"
  sensitive   = false
}

variable "api_suffix" {
  type        = string
  description = "the suffix to append to the API Gateway name after the stack name"
  default     = "api"
  sensitive   = false
}

variable "binary_media_types" {
  type        = list(string)
  description = "the list of binary media types supported by the RestApi"
  default     = []
  sensitive   = false
}

variable "body" {
  type        = string
  description = "the rendered OpenAPI specification of the API Gateway"
  sensitive   = false
}

variable "client_certificate_id" {
  type        = string
  description = "the ID of the client certificate to use for the stage"
  default     = null
  sensitive   = false
}

variable "cluster_cache_enabled" {
  type        = bool
  description = "whether to enable the cache cluster for the stage"
  default     = false
  sensitive   = false
}

variable "cluster_cache_size" {
  type        = string
  description = "the size of the cache cluster for the stage, if enabled"
  default     = "0.5"
  sensitive   = false
}

variable "create_cloudwatch_role" {
  type        = bool
  description = "whether to create a role for CloudWatch logging - only one role is needed per account"
  default     = false
  sensitive   = false
}

variable "disable_execute_api_endpoint" {
  type        = bool
  description = ""
  default     = false
  sensitive   = false
}

variable "fail_on_warnings" {
  type        = bool
  description = "whether to fail the Terraform plan if there are any warnings"
  default     = true
  sensitive   = false
}

variable "minimum_compression_size" {
  type        = number
  description = "the minimum size in bytes of a response before compression is enabled"
  default     = 0
  sensitive   = false
}

variable "parameters" {
  type        = map(string)
  description = "a map of parameters that are passed to the integration endpoint or method request from the method"
  default     = {}
  sensitive   = false
}

variable "put_rest_api_mode" {
  type        = string
  description = "the mode to use when updating the RestApi resource"
  default     = null
  sensitive   = false
}

variable "variables" {
  type        = map(string)
  description = "a map of variables for the stage"
  default     = {}
  sensitive   = false
}

variable "xray_tracing_enabled" {
  type        = bool
  description = "whether to enable xray tracing for the stage"
  default     = false
  sensitive   = false
}

variable "api_access_log_format" {
  description = "The format of the access log file."
  type        = string
  default     = <<EOF
  {
	"requestTime": "$context.requestTime",
	"requestId": "$context.requestId",
	"httpMethod": "$context.httpMethod",
	"path": "$context.path",
	"resourcePath": "$context.resourcePath",
	"status": $context.status,
	"responseLatency": $context.responseLatency,
  "xrayTraceId": "$context.xrayTraceId",
  "integrationRequestId": "$context.integration.requestId",
	"functionResponseStatus": "$context.integration.status",
  "integrationLatency": "$context.integration.latency",
	"integrationServiceStatus": "$context.integration.integrationStatus",
  "authorizeResultStatus": "$context.authorize.status",
	"authorizerServiceStatus": "$context.authorizer.status",
	"authorizerLatency": "$context.authorizer.latency",
	"authorizerRequestId": "$context.authorizer.requestId",
  "ip": "$context.identity.sourceIp",
	"userAgent": "$context.identity.userAgent",
	"principalId": "$context.authorizer.principalId",
	"cognitoUser": "$context.identity.cognitoIdentityId",
  "user": "$context.identity.user"
}
  EOF
}
