variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
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
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "cluster" {
  type        = string
  description = "id of the cluster associated with the service"
  sensitive   = false
}

variable "container_name" {
  type        = string
  description = "name of the container this service hosts"
  sensitive   = false
}

variable "container_port" {
  type        = number
  description = "the port exposed for the container for inbound traffic"
  sensitive   = false
}

variable "desired_count" {
  type        = number
  description = "desired number of containers for the service to run"
  default     = 1
  sensitive   = false
}

variable "deployment_controller_type" {
  type        = string
  description = ""
  default     = "ECS"
  sensitive   = false
}

variable "deployment_maximum_percent" {
  type        = number
  description = "upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment"
  default     = 500
  sensitive   = false
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment"
  default     = 100
  sensitive   = false
}

variable "enable_ecs_managed_tags" {
  type        = bool
  description = "whether to enable Amazon ECS managed tags for the tasks within the service"
  default     = true
  sensitive   = false
}

variable "health_check_grace_period_seconds" {
  type        = number
  description = "number of seconds to wait until evaluating that a deployment is unhealthy"
  default     = 300
  sensitive   = false
}

variable "launch_type" {
  type        = string
  description = "launch type of the service - either EC2, FARGATE, or EXTERNAL"
  default     = "FARGATE"
  sensitive   = false
}

variable "microservice" {
  type        = string
  description = "the name to microservice that this ecs service orchestrates (i.e. 'frontend')"
  sensitive   = false
}

variable "platform_version" {
  type        = string
  description = "platform version on which to run your service - only applicable for launch_type set to FARGATE"
  default     = "1.4.0"
  sensitive   = false
}

variable "propagate_tags" {
  type        = string
  description = "determines whether tasks inherit tags from the TASK_DEFINITION or the SERVICE"
  default     = "SERVICE"
  sensitive   = false
}

variable "scheduling_strategy" {
  type        = string
  description = "scheduling strategy to use for the service - either 'REPLICA' or 'DAEMON' (later not supported by Fargate)"
  default     = "REPLICA"
  sensitive   = false
}

variable "security_groups" {
  type        = set(string)
  description = "arns of the security groups to attach to ecs services"
  sensitive   = false
}

variable "subnets" {
  type        = set(string)
  description = "ids of the target subnets for the ecs deployment"
  sensitive   = false
}

variable "target_group_arn" {
  type        = string
  description = "arn of the associated target group for the services"
  sensitive   = false
}

variable "task_definition" {
  type        = string
  description = "arn of the task definition associated with the service"
  sensitive   = false
}
