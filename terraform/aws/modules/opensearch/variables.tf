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

variable "automated_snapshot_start_hour" {
  type        = number
  description = "the hour in which snapshots will occur"
  default     = 22
  sensitive   = false
}

variable "availability_zone_count" {
  type        = number
  description = "number of availability zones for the domain to use"
  sensitive   = false
}

variable "cloudwatch_log_retention_in_days" {
  type        = number
  description = "number of days to retain cloudwatch logs"
  default     = 90
  sensitive   = false
}

variable "cold_storage_enabled" {
  type        = bool
  description = "whether to enable cold storage - master and ultrawarm nodes but be enabled for cold storage to be compatible"
  default     = false
  sensitive   = false
}

variable "create_domain_policy" {
  type        = bool
  description = "create domain policy that allows aws principles to perform http requests to the domain"
  default     = true
  sensitive   = false
}

variable "create_security_group" {
  type        = bool
  description = "whether to create a security group with default ingress and egress rules"
  default     = true
  sensitive   = false
}

variable "custom_endpoint_certificate_arn" {
  type        = string
  description = "the arn of the certificate to use for the custom endpoint"
  default     = null
  sensitive   = false
}

variable "custom_endpoint" {
  type        = bool
  description = "fully-qualified domain for the custom endpoint"
  default     = null
  sensitive   = false
}

variable "custom_endpoint_enabled" {
  type        = bool
  description = "create custom endpoint for the domain cluster"
  default     = false
  sensitive   = false
}

variable "dedicated_master_count" {
  type        = number
  description = "number of dedicated master nodes in the cluster"
  sensitive   = false
}

variable "dedicated_master_enabled" {
  type        = bool
  description = "whether dedicated master nodes are turned-on for the cluster"
  sensitive   = false
}

variable "dedicated_master_type" {
  type        = string
  description = "type of dedicated master nodes for the cluster"
  sensitive   = false
}

variable "domain_name_suffix" {
  type        = string
  description = "the domain name suffix that follows the stack name"
  default     = "opensearch"
  sensitive   = false
}

variable "ebs_enabled" {
  type        = bool
  description = "whether to attach ebs volumes to the domain"
  default     = true
  sensitive   = false
}

variable "ebs_iops" {
  type        = number
  description = "baseline input/output (I/O) performance of the ebs volumes attached to each node"
  default     = 3000
  sensitive   = false
}

variable "ebs_throughput" {
  type        = number
  description = "throughput (MiB) of the ebs volumes - valid range between 125 and 1000"
  default     = 125
  sensitive   = false
}

variable "ebs_volume_size" {
  type        = number
  description = "size of the volumes attached to each node (GB)"
  default     = 10
  sensitive   = false
}

variable "ebs_volume_type" {
  type        = string
  description = "type of ebs volumes"
  default     = "gp3"
  sensitive   = false
}

variable "engine_version" {
  type        = string
  description = "the opensearch engine version"
  sensitive   = false
}

variable "instance_count" {
  type        = number
  description = "number of instances in the domain cluster"
  sensitive   = false
}

variable "instance_type" {
  type        = string
  description = "type of instance of the domain cluster"
  sensitive   = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "id of the security group(s) to associate with the cluster - required if create_security_group is false"
  default     = []
  sensitive   = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "ids of the target subnet(s) for the opensearch cluster deployment"
  sensitive   = false
}

variable "vpc_id" {
  type        = string
  description = "id of the vpc the cluster is deployed to"
  sensitive   = false
}

variable "warm_count" {
  type        = number
  description = "number of warm nodes in the domain cluster"
  default     = null
  sensitive   = false
}

variable "warm_enabled" {
  type        = bool
  description = "whether to enable warm storage"
  default     = false
  sensitive   = false
}

variable "zone_awareness_enabled" {
  type        = bool
  description = "whether to enable zone awareness"
  default     = false
  sensitive   = false
}

variable "warm_type" {
  type        = string
  description = "instance type for warm nodes - valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search"
  default     = null
  sensitive   = false
}
