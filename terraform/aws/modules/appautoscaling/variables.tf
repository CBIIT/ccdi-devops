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
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
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

variable "ecs_cluster_name" {
  type        = string
  description = "name of the ecs cluster that the autoscaling target belongs to"
  sensitive   = false
}

variable "ecs_service_name" {
  type        = string
  description = "name of the ecs service that the autoscaling target belongs to"
  sensitive   = false
}

variable "max_capacity" {
  type        = number
  description = "max capacity of the scalable target"
  default     = 4
  sensitive   = false
}

variable "microservice" {
  type        = string
  description = "the name of the microservice for the app autoscaling policy and target - i.e. frontend, backend, etc."
  sensitive   = false
}

variable "min_capacity" {
  type        = number
  description = "minimum capacity of the scalable target"
  default     = 1
  sensitive   = false
}

variable "policy_type" {
  type        = string
  description = "scaling policy - either 'StepScaling' or 'TargetTrackingScaling'"
  default     = "TargetTrackingScaling"
  sensitive   = false
}

variable "scalable_dimension" {
  type        = string
  description = "calable dimension of the scalable target - use outputs from appautoscaling target resource"
  default     = "ecs:service:DesiredCount"
  sensitive   = false
}

variable "service_namespace" {
  type        = string
  description = "aws service namespace of the scalable target - use outputs from the appautoscaling target resource"
  default     = "ecs"
  sensitive   = false
}

variable "target_value" {
  type        = number
  description = "target value of the metric to invoke autoscaling activity"
  default     = 80
  sensitive   = false
}

variable "predefined_metric_type" {
  type        = string
  description = "the name of the pre-defined aws cloudwatch metric type to base autoscaling activities on"
  default     = "ECSServiceAverageCPUUtilization"
  sensitive   = false
}
