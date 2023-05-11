variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "access_logs_bucket" {
  type        = string
  description = "The log bucket to send S3 access logs to"
}

variable "env" {
  type = string
}

variable "internal" {
  type        = bool
  description = "Set to true for non-prod accounts that do have allowable internet egress"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "security_group_id" {
  type = list(string)
}

variable "subnets" {
  type        = set(string)
  description = "The subnets associated with the load balancer"
}
