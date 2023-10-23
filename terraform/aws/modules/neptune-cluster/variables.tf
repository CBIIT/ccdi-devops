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

variable "allow_major_version_upgrade" {
  type        = string
  description = "indicates that major version upgrades are allowed"
  default     = false
  sensitive   = false
}

variable "apply_immediately" {
  type        = string
  description = "indicates whether the changes should be applied immediately or during the next maintenance window"
  default     = true
  sensitive   = false
}

variable "backup_retention_period" {
  type        = string
  description = "number of days to retain backups for"
  default     = 1
  sensitive   = false
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "whether to copy tags to snapshots"
  default     = true
  sensitive   = false
}

variable "database_subnet_ids" {
  type        = set(string)
  description = "the list of subnet IDs to associate with the cluster"
  sensitive   = false
}

variable "deletion_protection" {
  type        = bool
  description = "whether to enable deletion protection"
  default     = true
  sensitive   = false
}

variable "enable_caching" {
  type        = bool
  description = "whether to enable caching for the cluster"
  default     = false
  sensitive   = false
}

variable "enable_cloudwatch_logs_exports" {
  type        = list(string)
  description = "list of log types to export to cloudwatch"
  default     = ["audit"]
  sensitive   = false
}

variable "engine" {
  type        = string
  description = "the name of the database engine to be used for this instance"
  default     = "neptune"
  sensitive   = false
}

variable "engine_version" {
  type        = string
  description = "the version of the database engine to use"
  sensitive   = false
}

variable "final_snapshot_identifier" {
  type        = string
  description = "the name of the final snapshot to be created immediately before deleting the cluster"
  default     = null
  sensitive   = false
}

variable "iam_roles" {
  type        = set(string)
  description = "the list of IAM roles to associate with the cluster"
  default     = []
  sensitive   = false
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "whether to enable IAM database authentication for the cluster"
  default     = false
  sensitive   = false
}

variable "preferred_backup_window" {
  type        = string
  description = "the daily time range during which automated backups are created if automated backups are enabled"
  default     = "07:00-09:00"
  sensitive   = false
}

variable "preferred_maintenance_window" {
  type        = string
  description = "the weekly time range during which system maintenance can occur, in (UTC)"
  default     = "sun:05:00-sun:09:00"
  sensitive   = false
}

variable "port" {
  type        = number
  description = "the port on which the DB accepts connections"
  default     = 8182
  sensitive   = false
}

variable "query_timeout" {
  type        = string
  description = "time in milliseconds that a query can run before it is terminated by the cluster"
  default     = "120,000"
  sensitive   = false
}

variable "replication_source_identifier" {
  type        = string
  description = "the ARN of the source Neptune instance if this Neptune instance is a read replica"
  default     = null
  sensitive   = false
}

variable "skip_final_snapshot" {
  type        = bool
  description = "whether to skip the creation of a final snapshot before deleting the cluster"
  default     = true
  sensitive   = false
}

variable "snapshot_identifier" {
  type        = string
  description = "the name of an existing snapshot from which to create this cluster"
  default     = null
  sensitive   = false
}

variable "vpc_security_group_ids" {
  type        = set(string)
  description = "the list of security group IDs to associate with the cluster"
  sensitive   = false
}