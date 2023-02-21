variable "app" {
  type        = string
  description = "The name of the application, often times an acronym in all lower case characters (i.e. 'mtp')"
}

variable "program" {
  type        = string
  description = "The name of the program that the ALB belongs to"
}

variable "tier" {
  type = string
}

variable "desired_count" {
  type    = number
  default = 2
}
variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "scheduling_strategy" {
  type    = string
  default = "Replica"
}
variable "deployment_minimum_healthy_percent" {
  type    = number
  default = 50
}

variable "deployment_maximum_percent" {
  type    = number
  default = 200
}
variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "frontend_target_group_arn" {
  type = string
}

variable "frontend_container_name" {
  type    = string
  default = "frontend"
}

variable "frontend_container_port" {
  type    = number
  default = 80
}

variable "webapp_subnets" {
  type        = list(string)
  description = "The IDs of the private subnets that host the application compute resources"
}

variable "backend_target_group_arn" {
  type = string
}

variable "backend_container_name" {
  type    = string
  default = "backend"
}

variable "backend_container_port" {
  type    = number
  default = 8080
}

variable "ecs_network_mode" {
  description = "ecs network mode - bridge,host,awsvpc"
  type        = string
  default     = "awsvpc"
}
variable "frontend_definition_image" {
  description = "name of the frontend container image"
  type        = string
}

variable "backend_definition_image" {
  description = "name of the backend container image"
  type        = string
}

variable "frontend_cpu" {
  type    = string
  default = "256"
}

variable "frontend_memory" {
  type    = string
  default = "512"
}

variable "execution_role_arn" {
  type = string
}

variable "task_role_arn" {
  type = string
}

variable "backend_cpu" {
  type    = string
  default = "256"
}

variable "backend_memory" {
  type    = string
  default = "512"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID"
}
//
//variable "alb_security_group_id" {
//  type        = string
//  description = "alb security group id to receive traffic from"
//}