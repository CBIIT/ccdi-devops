##################################
#  Required Variables ############
##################################

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

variable "bucket_name" {
  type        = string
  description = "The suffix for the name of the bucket. Use it to describe the purpose of the bucket"
}

##################################
#  Optional Variables ############
##################################

variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}

variable "version_configuration_status" {
  type    = string
  default = "Enabled"
}
