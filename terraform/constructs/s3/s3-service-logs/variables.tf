variable "program" {
  type        = string
  description = "Provide the name of the program this app or project supports (i.e. ccdi)"
}

variable "app" {
  type        = string
  description = "Provide the name of the app or project that this bucket supports"
}

variable "level" {
  type        = string
  description = "Specify the tier or the account-level. Tiers examples include dev, qa while account-levels are prod and nonprod"
}

variable "target_log_bucket" {
  type        = string
  description = "The name of the bucket where you want Amazon S3 to store server access logs (provide the ID)"
}
