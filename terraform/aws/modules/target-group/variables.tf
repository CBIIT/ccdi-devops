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

variable "port" {
  type        = number
  description = "port on which targets receive traffic, unless overridden when registering a specific target"
  sensitive   = false
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc the target group is deployed to"
  sensitive   = false
}

variable "health_check_path" {
  type        = string
  description = "The destination for the health check request"
  default     = "/"
  sensitive   = false
}

variable "health_check_port" {
  type        = string
  description = "The port the load balancer uses when performing health checks on targets"
  default     = "traffic-port"
  sensitive   = false
}

variable "health_check_protocol" {
  type        = string
  description = "The protocol the load balancer uses when performing health checks on targets"
  default     = "HTTP"
  sensitive   = false
}

variable "health_check_matcher" {
  type        = string
  description = "The HTTP codes to use when checking for a successful response from a target"
  default     = "200"
  sensitive   = false
}

variable "health_check_interval" {
  type        = number
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  default     = 30
  sensitive   = false
}

variable "health_check_timeout" {
  type        = number
  description = "The amount of time, in seconds, during which no response means a failed health check"
  default     = 20
  sensitive   = false
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "number of consecutive health checks successes required before considering an unhealthy target healthy"
  default     = 5
  sensitive   = false
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "The number of consecutive health check failures required before considering a target unhealthy"
  default     = 5
  sensitive   = false
}

variable "protocol" {
  type        = string
  description = "The protocol to use for routing traffic to the targets"
  default     = "HTTP"
  sensitive   = false
}

variable "resource_name_suffix" {
  type        = string
  description = "the suffix of the target group name following the stack name"
  sensitive   = false
}

variable "stickiness_cookie_duration" {
  type        = number
  description = "time period, in seconds, during which requests from a client should be routed to the same target."
  default     = 1800
  sensitive   = false
}

variable "stickiness_enabled" {
  type        = bool
  description = "enable or disable stickiness"
  default     = true
  sensitive   = false
}

variable "stickiness_type" {
  type        = string
  description = "The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs"
  default     = "lb_cookie"
  sensitive   = false
}

variable "target_type" {
  type        = string
  description = "The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address). The default is instance. Note that you can't specify targets for a target group using both instance IDs and IP addresses. If the target type is ip, specify IP addresses from the subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range ("
  default     = "ip"
  sensitive   = false
}
