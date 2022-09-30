##################################
#  Required Variables ############
##################################

variable "access_logs_bucket" {
  type        = string
  description = "The log bucket to send S3 access logs to"
}

variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "domain_certificate_arn" {
  type        = string
  description = "The ARN of the certificate manager domain certificate for the ALB"
}

variable "frontend_port" {
  type    = string
  default = "80"
}

variable "frontend_target_description" {
  type        = string
  description = "Describing the target, such as frontend or backend"
  default     = "frontend"
}

variable "internal" {
  type        = bool
  description = "Set to true for non-prod accounts that do have allowable internet egress"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "public_subnets" {
  type        = set(string)
  description = "The subnets associated with the load balancer"
}

variable "security_group_ingress_cidr" {
  type = list(string)
}

variable "tier" {
  type        = string
  description = "The tier or environment that the load balancer belongs to"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the target group"
}

##################################
#  Optional Variables ############
##################################

variable "alb_listener_ssl_policy" {
  type        = string
  description = "The ssl policy to associate with the HTTPS listener for the ALB"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "backend_port" {
  type    = string
  default = "8080"
}

variable "backend_target_description" {
  type        = string
  description = "Describing the target, such as frontend or backend"
  default     = "backend"
}

variable "drop_invalid_header_fields" {
  type        = bool
  description = "Indecates whether or not headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false)"
  default     = true
}

variable "enable_deletion_protection" {
  type        = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = true
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

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_matcher" {
  type    = string
  default = "200"
}

variable "frontend_health_check_path" {
  type    = string
  default = "/"
}

variable "backend_health_check_path" {
  type    = string
  default = "/ping"
}

variable "health_check_port" {
  type    = string
  default = "traffic-port"
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_timeout" {
  type    = number
  default = 10
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 5
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

variable "http_redirect_status_code" {
  type        = string
  description = "The HTTP redirect to HTTPS default status code"
  default     = "HTTP_301"
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

variable "load_balancer_type" {
  type        = string
  description = "The type of load balancer to create. Possible values are application, gateway, or network. The default value is application"
  default     = "application"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "stickiness_cookie_duration" {
  type        = number
  description = "The time period, in seconds, during which requests from a client should be routed to the same target."
  default     = 1800
}

variable "stickiness_enabled" {
  type        = bool
  description = "Enable or disable stickiness"
  default     = true
}

variable "stickiness_type" {
  type        = string
  description = "The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs"
  default     = "lb_cookie"
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 5
}

variable "target_type" {
  type    = string
  default = "ip"
}

variable "timeout_create" {
  type        = string
  description = "The time allowed for timeout when creating the ALB resource."
  default     = "10m"
}


