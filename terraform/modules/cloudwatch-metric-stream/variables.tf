variable "iam_prefix" {
  type    = string
  default = "power-user"
}

variable "program" {
  type = string
}

variable "app" {
  type = string
}

variable "level" {
  type = string
}

variable "role_force_detach_policies" {
  type    = bool
  default = false
}

variable "firehose_delivery_stream_arn" {
  type = string
}

