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

variable "allocated_storage" {
  type        = number
  description = "the amount of storage to allocate to the rds instance (in GB)"
  sensitive   = false
}

variable "apply_immediately" {
  type        = bool
  description = "whether or not to apply changes immediately"
  default     = true
  sensitive   = false
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "whether to allow major version upgrades"
  default     = false
  sensitive   = false
}

variable "attach_permissions_boundary" {
  type        = bool
  description = "whether to attach a permissions boundary to the role - required if enable_enhanced_monitoring is true"
  default     = null
  sensitive   = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "whether to automatically upgrade to the latest minor version of the postgres database engine"
  default     = false
  sensitive   = false
}

variable "backup_retention_period" {
  type        = number
  description = "the number of days to retain backups for the rds instance"
  default     = 1
  sensitive   = false
}

variable "backup_window" {
  type        = string
  description = "the backup window for the rds instance in UTC time"
  default     = "02:00-03:00"
  sensitive   = false
}

variable "create_db_subnet_group" {
  type        = bool
  description = "whether to create a db subnet group for the rds instance"
  default     = true
  sensitive   = false
}

variable "create_security_group" {
  type        = bool
  description = "whether to create a security group for the rds instance"
  default     = true
  sensitive   = false
}

variable "db_name" {
  type        = string
  description = "name of the database thats created with the instance (defaults to 'postgres' if null)"
  default     = null
  sensitive   = false
}

variable "db_subnet_group_name" {
  type        = string
  description = "name of the db subnet group - required if create_db_subnet_group is false"
  default     = null
  sensitive   = false
}

variable "deletion_protection" {
  type        = bool
  description = "whether or not to enable deletion protection for the rds instance"
  default     = true
  sensitive   = false
}

variable "enable_enhanced_monitoring" {
  type        = bool
  description = "whether to enable enhanced monitoring for the rds instance"
  default     = false
  sensitive   = false
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "list of log types to export to cloudwatch"
  default     = ["postgresql", "upgrade"]
  sensitive   = false
}

variable "engine_version" {
  type        = string
  description = "version of the postgres database engine to use"
  sensitive   = false
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "whether or not to enable IAM database authentication"
  default     = false
  sensitive   = false
}

variable "instance_class" {
  type        = string
  description = "instance class to use for the rds instance"
  sensitive   = false
}

variable "iops" {
  type        = number
  description = "the amount of provisioned iops for the rds instance"
  default     = 12000
  sensitive   = false
}

variable "maintenance_window" {
  type        = string
  description = "the maintenance window for the rds instance in UTC time"
  default     = "Sun:05:00-Sun:07:00"
  sensitive   = false
}

variable "monitoring_interval" {
  type        = number
  description = "the interval (in seconds) between points when enhanced monitoring metrics are collected for the rds instance (set to 0 to disable)"
  default     = 60
  sensitive   = false
}

variable "multi_az" {
  type        = bool
  description = "whether or not to create a multi-az rds instance"
  default     = false
  sensitive   = false
}

variable "password" {
  type        = string
  description = "password to use for the rds instance"
  sensitive   = true
}

variable "performance_insights_enabled" {
  type        = bool
  description = "whether or not to enable performance insights for the rds instance"
  default     = false
  sensitive   = false
}

variable "performance_insights_retention_period" {
  type        = number
  description = "the number of days to retain performance insights data for the rds instance"
  default     = 7
  sensitive   = false
}

variable "rds_suffix" {
  type        = string
  description = "suffix to append to the rds instance name after the stack name"
  default     = "rds-postgres"
  sensitive   = false
}

variable "storage_throughput" {
  type        = number
  description = "the amount of throughput (in MB/s) to provision for the rds instance"
  default     = 500
  sensitive   = false
}

variable "storage_type" {
  type        = string
  description = "type of storage to use for the rds instance - either io1, gp2, or gp3"
  default     = "gp3"
  sensitive   = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "list of subnet ids to associate with the rds instance - necessary if create_db_subnet_group is true"
  default     = []
  sensitive   = false
}

variable "username" {
  type        = string
  description = "username to use for the rds instance"
  sensitive   = false
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc to create the rds instance in"
  sensitive   = false
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "list of security group ids to associate with the rds instance - only necessary if create_security_group is false"
  default     = []
  sensitive   = false
}
