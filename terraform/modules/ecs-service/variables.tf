##################################
#  Required Variables ############
##################################


##################################
#  Optional Variables ############
##################################
variable "target_group_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "enable_ecs_managed_tags" {
  type    = bool
  default = true
}
variable "deployment_controller_type" {
  type    = string
  default = "ECS"
}
variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "security_group_ids" {
  type = set(string)

}

variable "webapp_subnets" {
  type = set(string)
}

variable "deployment_circuit_breaker_enable" {
  type    = bool
  default = true
}

variable "deployment_circuit_breaker_rollback" {
  type    = bool
  default = true
}

variable "deployment_minimum_healthy_percent" {
  type    = number
  default = 50
}

variable "deployment_maximum_percent" {
  type    = number
  default = 200
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "scheduling_strategy" {
  type    = string
  default = "Replica"
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "program" {

}

variable "app" {

}

variable "tier" {

}

variable "ecs_service_name" {

}

variable "cluster_id" {

}

variable "task_definition" {

}