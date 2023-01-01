resource "aws_ecs_task_definition" "this" {
  family                   = "${local.stack}-${var.descriptor}"
  network_mode             = var.network_mode
  skip_destroy             = var.skip_destroy
  cpu                      = var.cpu
  ipc_mode                 = var.ipc_mode
  memory                   = var.memory
  requires_compatibilities = var.requires_compatibilities
  task_role_arn            = var.task_role_arn
  pid_mode                 = var.pid_mode
  execution_role_arn       = var.execution_role_arn

  runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }

}

variable "cpu" {
  type = number 
  description = "Number of cpu units used by the task"
  default = 1024
}

variable "memory" {
  type = number
  description = "Amount (in MiB) of memory used by the task"
  default = 2048
}

variable "task_role_arn" {
  type = string 
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
}

variable "skip_destroy" {
  type = bool 
  description = "Whether to retain the old revision when the resource is destroyed or replacement is necessary"
  default = false
}

variable "execution_role_arn" {
  type        = string
  description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
}

variable "program" {
  type = string
}

variable "tier" {
  type = string
}

variable "app" {
  type = string
}

variable "descriptor" {
  type        = string
  description = "backend, frontend, newrelic, etc"
}

variable "pid_mode" {
  type        = string
  description = "Not used for Fargate architectures"
  default     = null
}


variable "operating_system_family" {
  type        = string
  description = "Type of operating system used by the containers"
  default     = "LINUX"
}

variable "cpu_architecture" {
  type        = string
  description = "The architecture of the host that containers run on"
  default     = "X86_64"
}

variable "requires_compatibilities" {
  type        = set(string)
  description = "Set of launch types required by the task"
  default     = ["FARGATE"]
}

variable "network_mode" {
  type        = string
  description = "Docker networking mode to use for the containers in the task"
  default     = "awsvpc"
}

variable "ipc_mode" {
  type        = string
  description = "Not used for Fargate architectues"
  default     = null
}