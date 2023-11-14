variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod", "sandbox"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', 'nonprod', and 'sandbox'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos", "fnl"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', 'fnl' and 'ctos'"
  }
}

variable "container_environment_variables" {
  type        = map(string)
  description = "map of environment variables to pass to the container"
  sensitive   = false
  default     = {}
}

variable "container_image_url" {
  type        = string
  description = "provide the ecr repository url for the microservice container image"
  sensitive   = false
}

variable "cpu" {
  type        = string
  description = "number of cpu units used by the task"
  default     = "2048"
  sensitive   = false

  validation {
    condition     = contains(["512", "1024", "2048", "4096", "8192", "16384"], var.cpu)
    error_message = "valid values are '512', '1024', '2048', '4096', '8192', and '16384'"
  }
}

variable "execution_role_arn" {
  type        = string
  description = "arn of the role the task assigns to the ECS container agent and the Docker daemon"
  sensitive   = false
}

variable "memory" {
  type        = number
  description = "amount (MiB) of memory used by the task"
  default     = "2048"
  sensitive   = false

  validation {
    condition     = contains([512, 1024, 2048, 3072, 4096, 5120, 6144, 7168, 8192, 16384], var.memory)
    error_message = "valid values are '512', '1024', '2048', '3072', '4096', '5120', '6144', '7168', '8192', and '16384'"
  }
}

variable "microservice" {
  type        = string
  description = "name of the microservice this task supports - i.e. backend, frontend, files"
  sensitive   = false
}

variable "port" {
  type        = number
  description = "port the microservice listens on"
  sensitive   = false
}

variable "secret_arn" {
  type        = string
  description = "arn of the secret that contains the newrelic license key (NRIA_LICENSE_KEY)"
  sensitive   = false
}

variable "sumo_collector_token" {
  type        = string
  description = "sumologic collector token"
  sensitive   = true
}

variable "task_role_arn" {
  type        = string
  description = "arn of role the task uses to call other aws services"
  sensitive   = false
}
