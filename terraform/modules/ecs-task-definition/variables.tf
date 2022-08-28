##################################
#  Required Variables ############
##################################

variable "app" {
  type        = string
  description = "The name of the application, use abbreviation (i.e. mtp)"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "tier" {
  type        = string
  description = "The target tier or environment {i.e. dev}. Use terraform.workspace when applicable"
}

variable "family" {
  type        = string
  description = "A unique name for the task definition"
}

variable "memory" {
  type = string
  description = "Amount (in MiB) of memory used by the task"
}

variable "execution_role_arn" {
  type = string 
  description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
}

variable "task_role_arn" {
  type = string 
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
}

variable "cpu" {
  type = string 
  description = "Number of CPU units consumed by the task"
}

variable "container_definition_name" {
  type = string
}

variable "container_definition_image" {
  type = string
}

variable "container_definition_essential" {
  type = string

}

variable "container_port" {
  
}

variable "host_port" {
  
}

##################################
#  Optional Variables ############
##################################


variable "requires_compatibilities" {
  type        = string
  description = "Launch type required by the task (EC2 or FARGATE)"
  default     = "FARGATE"
}

variable "network_mode" {
  type        = string
  description = "Docker networking mode to use for the containers in the task. Valid values are none, bridge, awsvpc, and host."
  default     = "awsvpc"
}