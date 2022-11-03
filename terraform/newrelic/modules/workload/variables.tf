variable "program" {
    type = string 
    description = "the name of the program"
  default = "ccdi"
}

variable "app" {
    type = string 
    description = "the name of the application"
}

variable "tier" {
  type = string 
  description = "the name of the tier or environment"
}

variable "new_relic_account_id" {
  type = number 
  description = "the seven digit id of the new relic account"
}