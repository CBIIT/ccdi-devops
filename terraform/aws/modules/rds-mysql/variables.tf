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

variable "create_db_subnet_group" {
  type        = bool
  description = "whether to create a db subnet group"
  default     = true
  sensitive   = false
}

variable "db_name" {
  type        = string
  description = "name of the database within RDS to create"
  sensitive   = false
}

variable "db_subnet_group_name" {
  type        = string
  description = "name of the db subnet group - required if create_db_subnet_group is false"
  default     = null
  sensitive   = false
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "list of subnet ids to place the instance in - required if create_db_subnet_group is true"
  default     = []
  sensitive   = false
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "list of log types to export to cloudwatch"
  default     = ["audit", "error", "general", "slowquery"]
  sensitive   = false
}

variable "engine" {
  type        = string
  description = "database engine to use"
  default     = "mysql"
  sensitive   = false
}

variable "engine_version" {
  type        = string
  description = "database engine version to use - if auto_minor_version_upgrade is true, no need to specify patch version"
  default     = "8.0"
  sensitive   = false
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "whether to enable iam database authentication"
  default     = false
  sensitive   = false
}

variable "instance_class" {
  type        = string
  description = "rds instance class to use"
  default     = "db.t3.medium"
  sensitive   = false
}


variable "performance_insights_enabled" {
  type        = bool
  description = "whether to enable performance insights"
  default     = true
  sensitive   = false
}

variable "rds_suffix" {
  type        = string
  description = "suffix to append to the rds instance name"
  default     = "rds"
  sensitive   = false
}

