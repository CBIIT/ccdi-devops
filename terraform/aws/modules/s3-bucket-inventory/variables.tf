variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos", "fnl"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', 'fnl' and 'ctos'"
  }
}

variable "bucket_id" {
  type        = string
  description = "the name of the bucket"
  sensitive   = false
}

variable "bucket_suffix" {
  type        = string
  description = "the suffix to be applied to the bucket name"
  sensitive   = false
}

variable "destination_bucket_arn" {
  type        = string
  description = "arn of the bucket to which the inventory will be delivered"
  sensitive   = false
}

variable "destination_format" {
  type        = string
  description = "the format of the inventory"
  default     = "CSV"
  sensitive   = false

  validation {
    condition     = contains(["CSV", "ORC", "Parquet"], var.destination_format)
    error_message = "valid values for destination_format are 'CSV', 'ORC', or 'Parquet'"
  }

}

variable "filter_prefix" {
  type        = string
  description = "the prefix to be applied to the inventory (e.g. 'logs/')"
  default     = null
  sensitive   = false
}

variable "included_object_versions" {
  type        = string
  description = "the object versions to be included in the inventory"
  default     = "All"
  sensitive   = false

  validation {
    condition     = contains(["All", "Current"], var.included_object_versions)
    error_message = "valid values for included_object_versions are 'All' and 'Current'"
  }
}

variable "schedule_frequency" {
  type        = string
  description = "the frequency of the inventory"
  default     = "Daily"
  sensitive   = false

  validation {
    condition     = contains(["Daily", "Weekly"], var.schedule_frequency)
    error_message = "valid values for schedule_frequency are 'Daily' and 'Weekly'"
  }
}