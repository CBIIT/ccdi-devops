variable "app" {
  type = string
}

variable "associated_with" {
  type        = string
  description = "resource that the security group is associated with (i.e. alb)"
}

variable "description" {
  type        = string
  description = "purpose or description of the security group"
}

variable "program" {
  type = string
}

variable "tier" {
  type = string
}