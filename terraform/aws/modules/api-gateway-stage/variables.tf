variable "rest_api_id" {
  type        = string
  description = "the id of the api gateway rest api"
  sensitive   = false
}

variable "cache_cluster_enabled" {
  type        = bool
  description = "whether or not to enable the cache cluster"
  default     = false
  sensitive   = false
}

variable "cache_cluster_size" {
  type        = string
  description = "the size of the cache cluster for the stage if enabled - either 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 or 237"
  default     = null
  sensitive   = false
}

variable "client_certificate_id" {
  type        = string
  description = "the id of the client certificate to use for the stage"
  default     = null
  sensitive   = false
}

variable "description" {
  type        = string
  description = "the description of the stage"
  default     = null
  sensitive   = false
}

variable "log_retention_in_days" {
  type        = number
  description = "the number of days to retain access and execution logs for the stage"
  default     = 180
  sensitive   = false
}

variable "redeployment_trigger" {
  type        = string
  description = "the trigger to use for redeploying the stage - either a sha1 of the openapi spec (api body) or a timestamp"
  default     = null
  sensitive   = false
}

variable "stage_name" {
  type        = string
  description = "the name of the stage"
  default     = null
  sensitive   = false
}

variable "variables" {
  type        = map(string)
  description = "the variables to define for the stage"
  default     = {}
  sensitive   = false
}

variable "xray_tracing_enabled" {
  type        = bool
  description = "whether or not to enable xray tracing for the stage"
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