variable "app" {
  type        = string
  description = "The name of the application that the load balancer belongs to"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "security_group_ingress_cidr" {
  type        = list(string)
  description = "The CIDR block that ingress rules allow traffic to originate from for the alb"
}

//variable "security_group_nih_cidrs" {
//  type        = list(string)
//  description = "The CIDR block that outbound rules allow traffic to originate from for the alb"
//}

variable "tier" {
  type        = string
  description = "The name of the tier (use terraform.workspace when possible)"
}

variable "vpc_id" {
  type        = string
  description = "The target VPC associated with the alb security group"
}