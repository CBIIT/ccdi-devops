variable "app" {
  type        = string
  description = "The name of the application (i.e. 'mtp')"
}

variable "internal" {
  type        = bool
  description = "Set to true for non-prod accounts that do have allowable internet egress"
}

variable "program" {
  type        = string
  description = "The name of the program (i.e. 'ccdi')"
}

variable "env" {
  type        = string
  description = "The tier or environment (i.e. 'dev') - use 'terraform.workspace' for this variable"
}

variable "security_group_id" {
  type        = list(string)
  description = "The ID of the security group associated with the load balancer"
}

variable "public_subnets" {
  type        = set(string)
  description = "The subnets associated with the load balancer"
}

variable "access_logs_bucket" {
  type        = string
  description = "The log bucket to send S3 access logs to"
}
