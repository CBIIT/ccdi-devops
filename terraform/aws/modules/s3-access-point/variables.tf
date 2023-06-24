variable "access_point_suffix" {
  type        = string
  description = "suffix to append to the access point name to describe its use or allowed principals"
  sensitive   = false
}

variable "account_id" {
  type        = string
  description = "the account id of the account that owns the access point - defaults to account id of the terraform provider"
  default     = null
  sensitive   = false
}

variable "bucket_account_id" {
  type        = string
  description = "the account id of the account that owns the bucket - defaults to account id of the terraform provider"
  default     = null
  sensitive   = false
}

variable "bucket_name" {
  type        = string
  description = "name of the bucket to associate with the access point"
  sensitive   = false
}

variable "vpc_id" {
  type        = string
  description = "the vpc id from which to allow access to the bucket via the access point"
  sensitive   = false
}
