variable "role_arn" {
  type        = string
  description = "arn of the role that will be assumed by the eventbridge target resource"
  sensitive   = false
}

variable "rule_id" {
  type        = string
  description = "id of the eventbridge rule that will send event data to the target resource"
  sensitive   = false
}

variable "target_arn" {
  type        = string
  description = "arn of the target resource, such as another event bus, a lambda function, or an sns topic"
  sensitive   = false
}
