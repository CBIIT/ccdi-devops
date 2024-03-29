variable "allow_nih_access" {
  type        = bool
  description = "Set to true to allow traffic from the NIH network"
  default     = false
}

variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "tier" {
  type        = string
  description = "The name of the tier (use terraform.workspace when possible)"
}

variable "vpc_id" {
  type        = string
  description = "The target VPC associated with the alb security group"
}
//
//variable "ecs_security_group_id"{
//  type       = string
//  description = "ecs security group id"
//}
//
//variable "jenkins_IP" {
//  description = "jenkins slave IP"
//  default     = []
//  type        = list(string)
//}