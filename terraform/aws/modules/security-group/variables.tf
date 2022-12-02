variable "app" {
  type = string
}

variable "description" {
  type        = string
  description = "describe the purpose of the security group"
}

variable "environment" {
  type = string
}

variable "program" {
  type = string
}

variable "resource" {
  type        = string
  description = "the type of resource that the security group is associated with"
}

variable "revoke_rules_on_delete" {
  type        = bool
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  default     = true
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc for which the resource that the security is associated with resides"
}