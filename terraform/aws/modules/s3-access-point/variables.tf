variable "access_point_suffix" {
  type        = string
  description = "suffix to append to the access point name to describe its use or allowed principals"
  sensitive   = false
}

variable "bucket_name" {
  type        = string
  description = "name of the bucket to associate with the access point"
  sensitive   = false
}
