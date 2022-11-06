variable "account_id" {
  type        = number
  description = "the seven digit id of the new relic account"
}

variable "app" {
  type        = string
  description = "the name of the application"
}

variable "program" {
  type        = string
  description = "the name of the program"
  default     = "ccdi"
}
