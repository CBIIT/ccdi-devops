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

variable "comment" {
  type        = string
  description = "the comment for the cloudfront distribution"
  sensitive   = false
}

variable "default_cache_behavior" {
  type = map({
    allowed_methods        = optional(list(string), ["GET", "HEAD", "OPTIONS"])
    cached_methods         = optional(list(string), ["GET", "HEAD", "OPTIONS"])
    target_origin_id       = string
    viewer_protocol_policy = optional(string, "redirect-to-https")
  })
  description = "the default cache behavior for the cloudfront distribution"
  sensitive   = false
}

variable "default_root_object" {
  type        = string
  description = "the default root object for the cloudfront distribution"
  default     = "index.html"
  sensitive   = false
}

variable "enabled" {
  type      = bool
  default   = true
  sensitive = false
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "whether ipv6 is enabled for the cloudfront distribution"
  default     = true
  sensitive   = false
}

variable "logging_config_include_cookies" {
  type        = bool
  description = "whether to include cookies in the cloudfront distribution logs"
  default     = false
  sensitive   = false
}

variable "origin" {
  type = map({
    connection_attempts = optional(number, 3)
    connection_timeout  = optional(number, 10)
    domain_name         = string
    origin_id           = string
  })
  description = "the origin for the cloudfront distribution"
  sensitive   = false
}

variable "price_class" {
  type      = string
  default   = "PriceClass_100"
  sensitive = false
}

variable "restrictions_locations" {
  type        = list(string)
  description = "the list of locations to whitelist for the cloudfront distribution"
  default     = ["US"]
  sensitive   = false
}

variable "retain_on_delete" {
  type      = bool
  default   = true
  sensitive = false
}

variable "wait_for_deployment" {
  type      = bool
  default   = true
  sensitive = false
}

variable "viewer_certificate" {
  type = map({
    acm_certificate_arn      = optional(string, null)
    minimum_protocol_version = optional(string, "TLSv1.2_2019")
    ssl_support_method       = optional(string, "sni-only")
  })
  description = "the viewer certificate for the cloudfront distribution"
  sensitive   = false
}