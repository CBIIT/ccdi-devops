variable "enable_periodic_rules" {
  type        = bool
  description = "whether to enable rules that are evaluated periodically, not on changes - may increase costs"
  default     = false
  sensitive   = false
}
