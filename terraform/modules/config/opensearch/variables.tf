variable "opensearch_audit_logging_enabled" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_audit_logging_enabled"
  default     = true
}

variable "opensearch_encrypted_at_rest" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_encrypted_at_rest"
  default     = true
}

variable "opensearch_https_required" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_https_required"
  default     = true
}

variable "opensearch_in_vpc_only" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_in_vpc_only"
  default     = true
}

variable "opensearch_logs_to_cloudwatch" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_logs_to_cloudwatch"
  default     = true
}

variable "opensearch_node_to_node_encryption_check" {
  type        = bool
  description = "Create AWS-managed config rule titled: opensearch_node_to_node_encryption_check"
  default     = true
}