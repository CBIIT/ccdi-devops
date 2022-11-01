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
  default = "prod"
}

variable "new_relic_account_id" {
  default = 2292606
}