variable "program" {

}

variable "app" {

}

variable "level" {

}

variable "http_endpoint_url" {
  type        = string
  description = "The HTTP endpoint URL to which Kinesis Firehose sends your data"
  default     = "https://aws-api.newrelic.com/cloudwatch-metrics/v1"
}

variable "destination" {
  type        = string
  description = "the destination to where the data is delivered. The only options are extended_s3, redshift, elasticsearch, and http_endpoint"
  default     = "http_endpoint"
}

variable "s3_backup_mode" {
  type        = string
  description = "Defines how documents should be delivered to Amazon S3. Valid values are FailedDataOnly and AllData"
  default     = "FailedDataOnly"
}

variable "http_endpoint_access_key" {
  type        = string
  description = "The access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the destination"
}

variable "content_encoding" {
  default = "GZIP"
}

variable "s3_object_prefix" {
  type    = string
  default = null
}

variable "s3_error_output_prefix" {
  type    = string
  default = null
}

variable "http_endpoint_name" {
  type        = string
  description = "The HTTP endpoint name"
  default     = "New Relic"
}

variable "buffer_size" {
  type        = number
  description = "Buffer incoming data to the specified size, in MBs, before delivering it to the destination"
  default     = 1
}

variable "buffer_interval" {
  type        = number
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination"
  default     = 60
}

variable "external_id" {
  type        = string
  description = "The external id for the delivery stream trust policy condition"
}