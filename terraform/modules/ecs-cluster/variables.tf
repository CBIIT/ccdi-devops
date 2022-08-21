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

variable "container_insights_enabled" {
  type = string 
  description = "Enables ECS container insights. Valid values are 'enabled' and 'disabled'"
  default = "enabled"
}