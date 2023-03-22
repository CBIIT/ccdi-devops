variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
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
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "allocated_storage" {
  type        = number
  description = "allocated storage in gibibytes - minimum is 100"
  default     = 100
  sensitive   = false
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "allow major version upgrade"
  default     = false
  sensitive   = false
}

variable "apply_immediately" {
  type        = bool
  description = "whether to apply changes immediately or wait until next maintenance window"
  default     = true
  sensitive   = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "whether minor database modifications are automatically applied during maintenance windows"
  default     = true
  sensitive   = false
}

variable "availability_zone" {
  type        = string
  description = "availability zone to place the instance in"
  default     = null
  sensitive   = false
}

variable "backup_retention_period" {
  type        = number
  description = "backup retention period in days - between 0 and 35"
  default     = 7
  sensitive   = false
}

variable "backup_window" {
  type        = string
  description = "backup window in UTC - format hh24:mi-hh24:mi"
  default     = "00:00-04:00"
  sensitive   = false
}

variable "ca_cert_identifier" {
  type        = string
  description = "identifier of the ca cert for the rds instance"
  default     = null
  sensitive   = false
}

variable "rds_suffix" {
  type        = string
  description = "suffix to append to the rds instance name"
  default     = "rds"
  sensitive   = false
}

