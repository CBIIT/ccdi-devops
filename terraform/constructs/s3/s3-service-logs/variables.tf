variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "app" {
  type        = string
  description = "The name of the app or project that this bucket supports"
}

variable "level" {
  type        = string
  description = "The tier or the account-level. Tiers examples include dev, qa while account-levels are prod and nonprod"
}

variable "target_log_bucket" {
  type        = string
  description = "The name of the bucket where you want Amazon S3 to store server access logs (provide the ID)"
}

variable "tier" {
  type = string 
}

variable "account_id" {
  type = string 
  description = "The account ID where the S3 Log Bucket is hosted"
}