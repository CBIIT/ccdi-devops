variable "external_id" {
  type        = string
  description = "The external id for the delivery stream trust policy condition"
}

variable "new_relic_api_key" {
  type        = string
  description = "The access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the destination"
}