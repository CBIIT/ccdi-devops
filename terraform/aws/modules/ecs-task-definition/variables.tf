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

variable "container_definitions" {
  type        = string
  description = "provide the json document that defines the container definitions for this task"
}

variable "cpu" {
  type        = string
  description = "number of cpu units used by the task"
}

variable "execution_role_arn" {
  type        = string
  description = "arn of the role the task assigns to the ECS container agent and the Docker daemon"
}

variable "memory" {
  type        = string
  description = "amount (MiB) of memory used by the task"
}

variable "network_mode" {
  type        = string
  description = "docker networking mode to use for the containers in the task - either 'host', 'bridge', 'awsvpc' or 'none'"
  default     = "awsvpc"
}

variable "operating_system_family" {
  type        = string
  description = "if requires_compatibilities is FARGATE this field is required"
  default     = "LINUX"
}

variable "cpu_architecture" {
  type        = string
  description = "ust be set to either 'X86_64' or 'ARM64'"
  default     = "X86_64"
}

variable "requires_compatibilities" {
  type        = set(string)
  description = "et of launch types required by the task - can be 'EC2' and/or 'FARGATE'"
  default     = ["FARGATE"]
}

variable "task_name" {
  type        = string
  description = "name of the task - i.e. backend, frontend, files"
}

variable "task_role_arn" {
  type        = string
  description = "arn of role the task uses to call other aws services"
}
