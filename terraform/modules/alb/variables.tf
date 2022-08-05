variable "program" {
  type        = string
  description = "The name of the program that the ALB belongs to"
}

variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "tier" {
  type        = string
  description = "The name of the tier or environment that the load balancer belongs to"
}

variable "internal" {
  type        = bool
  description = "Set to true for non-prod accounts that do have allowable internet egress"
}

variable "load_balancer_type" {
  type        = string
  description = "The type of load balancer to create. Possible values are application, gateway, or network. The default value is application"
  default     = "application"
}

variable "drop_invalid_header" {
  type        = bool
  description = "Indecates whether or not headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false)"
  default     = true
}

variable "enable_deletion_protection" {
  type        = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = true
}

variable "security_group" {
  type = set(string)
  description = "The ID of the security group associated with the load balancer"
}

variable "subnets" {
  type = set(string)
  description = "The subnets associated with the load balancer"
}

variable "access_logs_bucket" {
  type        = string
  description = "The log bucket to send S3 access logs to"
}

variable "timeout_create" {
  type        = string
  description = "The time allowed for timeout when creating the ALB resource."
  default     = "10m"
}

variable "http_port" {
  type        = number
  description = "The standard HTTP port"
  default     = 80
}

variable "http_protocol" {
  type        = string
  description = "The standard HTTP protocol"
  default     = "HTTP"
}

variable "https_port" {
  type        = number
  description = "The standard HTTPS port"
  default     = 443
}

variable "https_protocol" {
  type        = string
  description = "The standard HTTPS protocol"
  default     = "HTTPS"
}

variable "http_redirect_status_code" {
  type        = string
  description = "The HTTP redirect to HTTPS default status code"
  default     = "HTTP_301"
}

variable "fixed_response_content_type" {
  type        = string
  description = "The fixed response HTTPS content type"
  default     = "text/plain"
}

variable "fixed_response_message_body" {
  type        = string
  description = "The default message body when an ALB is not allowing traffic from a fixed response action"
  default     = "The application is not available at this time. Please try again soon."
}

variable "fixed_response_status_code" {
  type        = string
  description = "The fixed response status code"
  default     = "200"
}