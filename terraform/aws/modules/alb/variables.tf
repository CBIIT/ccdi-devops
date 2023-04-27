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

variable "access_logs_enabled" {
  type        = bool
  description = "enables load balancer access logging"
  default     = false
  sensitive   = false
}

variable "access_logs_bucket" {
  type        = string
  description = "name of the destination bucket for load balancer access logs"
  default     = null
  sensitive   = false
}

variable "access_logs_prefix" {
  type        = string
  description = "directory prefix to store load balancer access logs within - default is root directory"
  default     = null
  sensitive   = false
}

variable "certificate_arn" {
  type        = string
  description = "arn of the certificate for HTTPS listeners, not needed for HTTP listeners"
  default     = null
  sensitive   = false
}

variable "create_http_listener" {
  type        = bool
  description = "whether to create an HTTP listener"
  default     = true
  sensitive   = false
}

variable "create_https_listener" {
  type        = bool
  description = "whether to create an HTTPS listener"
  default     = true
  sensitive   = false
}

variable "create_security_group" {
  type        = bool
  description = "whether to create a security group with default security group rules"
  default     = true
  sensitive   = false
}

variable "desync_mitigation_mode" {
  type        = string
  description = "how the load balancer handles requests that might pose a security risk to an application due to HTTP desync, either monitor, defensive, or strictest"
  default     = "strictest"
  sensitive   = false
}

variable "drop_invalid_header_fields" {
  type        = bool
  description = "whether HTTP headers with header fields that are not valid are removed by the load balancer"
  default     = true
  sensitive   = false
}

variable "enable_deletion_protection" {
  type        = bool
  description = "prevents terraform from accidentally destroying the load balancer"
  default     = true
  sensitive   = false
}

variable "enable_http2" {
  type        = bool
  description = "whether HTTP/2 is enabled in application load balancers"
  default     = true
  sensitive   = false
}

variable "enable_waf_fail_open" {
  type        = bool
  description = "whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the requests to waf"
  default     = false
  sensitive   = false
}

variable "http_port" {
  type        = number
  description = "port on which the load balancer is listening for HTTP requests"
  default     = 80
  sensitive   = false
}

variable "http_protocol" {
  type        = string
  description = "protocol on which the load balancer is listening for HTTP requests"
  default     = "HTTP"
  sensitive   = false
}

variable "https_port" {
  type        = number
  description = "port on which the load balancer is listening for HTTPS requests"
  default     = 443
  sensitive   = false
}

variable "https_protocol" {
  type        = string
  description = "protocol on which the load balancer is listening for HTTPS requests"
  default     = "HTTPS"
  sensitive   = false
}


variable "idle_timeout" {
  type        = number
  description = "in seconds, the amount of time the connection is permitted to be idle"
  default     = 60
  sensitive   = false
}

variable "internal" {
  type        = bool
  description = "whether the load balancer is internally facing"
  default     = false
  sensitive   = false
}

variable "preserve_host_header" {
  type        = bool
  description = "whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change"
  default     = true
  sensitive   = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "security group(s) to associate with the load balancer"
  default     = []
  sensitive   = false
}

variable "ssl_policy" {
  type        = string
  description = "the name of the SSL policy for the HTTPS listener"
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  sensitive   = false
}

variable "subnets" {
  type        = set(string)
  description = "the subnets to associate with the load balancer"
  sensitive   = false
}

variable "security_group_ingress_cidr" {
  type        = list(string)
  description = "CIDR block to be configured for the ALB inbound"
  default     = ["0.0.0.0/0"]
  sensitive   = false
}

variable "tags" {
  type        = map(string)
  description = "tags to apply to the load balancer and listeners (if created)"
  default     = {}
  sensitive   = false
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc for the alb"
  sensitive   = false
}
