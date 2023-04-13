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

variable "vpc_id" {
  type        = string
  description = "id of the vpc to create the security group in - required if create_security_group is true"
  default     = null
  sensitive   = false
}

variable "rds_suffix" {
  type        = string
  description = "suffix to append to the rds instance name"
  default     = "rds"
  sensitive   = false
}

variable "db_engine_type" {
  description = "Aurora database engine type"
  type        = string
  default     = "aurora-mysql"
}
variable "db_engine_version" {
  description = "aurora database engine version."
  type        = string
  default     = "5.6.10a"
}
variable "db_engine_mode" {
  type        = string
  default     = "serverless"
  description = "The database engine mode."
}
variable "database_name" {
  type        = string
  description = "name of the database within Aurora to create"
  sensitive   = false
}
variable "master_username" {
  type        = string
  description = "username for the database"
  sensitive   = false
}
variable "backup_retention_period" {
  type        = number
  description = "backup retention period in days - between 0 and 35"
  default     = 35
  sensitive   = false
}
variable "backup_window" {
  description = "ideal time to perform backups.backup window in UTC - format hh24:mi-hh24:mi"
  type        = string
  default     = "04:00-05:00"
}
variable "maintenance_window" {
  description = "time to perform maintenance"
  type        = string
  default     = "sun:00:00-sun:02:00"
}
variable "allow_major_version_upgrade" {
  description = "Enable to allow major engine version upgrades when changing engine versions"
  type        = bool
  default     = false
}
variable "deletion_protection" {
  description = "prevent deletion"
  type        = bool
  default     = false
}
variable "create_db_subnet_group" {
  type        = bool
  description = "whether to create a db subnet group"
  default     = true
  sensitive   = false
}
variable "db_subnet_group_name" {
  type        = string
  description = "name of the db subnet group - required if create_db_subnet_group is false"
  default     = null
  sensitive   = false
}
variable "create_security_group" {
  type        = bool
  description = "Whether to create a security group for the rds instance"
  default     = true
  sensitive   = false
}
variable "vpc_security_group_ids" {
  type        = list(string)
  description = "list of security group ids to associate with the instance - required if create_security_group is false"
  default     = []
  sensitive   = false
}
variable "max_capacity" {
  description = "The maximum capacity."
  type        = number
  default     = 2
}
variable "min_capacity" {
  description = "The minimum capacity."
  type        = number
  default     = 1
}
variable "tags" {
  type        = map(string)
  description = "map of tags to apply to the instance"
  default     = {}
  sensitive   = false
}

variable "db_instance_class" {
  description = "Instance type to use for the db"
  type        = string
  default     = "db.serverless"
}

variable "db_subnet_ids" {
  type        = list(string)
  default     = []
  description = "list of subnet IDs to usee"
}

variable "master_password_length" {
  description = "length of master user password"
  type        = number
  default     = 15
}

variable "enable_enhanced_monitoring" {
  type        = bool
  description = "whether to enable enhanced monitoring"
  default     = true
  sensitive   = false
}