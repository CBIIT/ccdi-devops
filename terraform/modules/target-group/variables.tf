##################################
#  Required Variables ############
##################################

variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "target_group_port" {
  type = number
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "target_description" {
  type        = string
  description = "Describing the target, such as frontend or backend"
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

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_port" {
  type    = string
  default = "traffic-port"
}

variable "health_check_protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_matcher" {
  type    = string
  default = "200"
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_timeout" {
  type    = number
  default = 10
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 5
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 5
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

variable "target_type" {
  type    = string
  default = "ip"
}
