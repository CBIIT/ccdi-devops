variable "iam_prefix" {
  type    = string
  default = "power-user"
}

variable "program" {
  type = string
}

variable "app" {
  type = string
}

variable "level" {
  type = string
}

variable "role_force_detach_policies" {
  type    = bool
  default = false
}

variable "firehose_delivery_stream_arn" {
  type = string
}

variable "output_format" {
  type        = string
  description = "Output format of the CloudWatch Metric Stream - can be json or opentelemetry0.7"
  default     = "opentelemetry0.7"
}

variable "account_id" {
  type        = string
  description = "Account ID for the deployment target - use 'data.aws_caller_identity.current.account_id"
}

variable "include_filter" {
  type        = set(string)
  description = "Specify the service namespaces to include in metric stream in a list"
}