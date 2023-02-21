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

variable "automated_snapshot_start_hour" {
  type        = number
  description = "the hour in which snapshots will occur"
  default     = 23
}

variable "availability_zone_count" {
  type        = number
  description = "number of availability zones for the domain to use"
}

variable "cloudwatch_log_retention_in_days" {
  type        = number
  description = "number of days to retain cloudwatch logs"
  default     = 90
}

variable "cold_storage_enabled" {
  type        = bool
  description = "whether to enable cold storage - master and ultrawarm nodes but be enabled for cold storage to be compatible"
  default     = false
}

variable "create_domain_policy" {
  type        = bool
  description = "create domain policy that allows aws principles to perform http requests to the domain"
  default     = true
}

variable "create_manual_snapshot_role" {
  type        = bool
  description = "whether to create a role to enable manual snapshot operations"
  default     = false
}


variable "create_service_linked_role" {
  type        = bool
  description = "whether to create a service linked role for OpenSearch - only one per account"
}

variable "custom_endpoint_enabled" {
  type        = bool
  description = "create custom endpoint for the domain cluster"
  default     = false
}

variable "dedicated_master_count" {
  type        = number
  description = "number of dedicated master nodes in the cluster"
}

variable "dedicated_master_enabled" {
  type        = bool
  description = "whether dedicated master nodes are turned-on for the cluster"
}

variable "dedicated_master_type" {
  type        = string
  description = "type of dedicated master nodes for the cluster"
}

variable "domain_name_suffix" {
  type        = string
  description = "the domain name suffix that follows the stack name"
  default     = "opensearch"
}

variable "domain_policy_actions" {
  type        = set(string)
  description = "The actions that the domain policy allows"
  default = [
    "es:ESHttpPut",
    "es:ESHttpPost",
    "es:ESHttpPatch",
    "es:ESHttpHead",
    "es:ESHttpGet",
    "es:ESHttpDelete"
  ]
}

variable "ebs_enabled" {
  type        = bool
  description = "whether to attach ebs volumes to the domain"
  default     = true
}

variable "ebs_iops" {
  type        = number
  description = "baseline input/output (I/O) performance of the ebs volumes attached to each node"
  default     = 3000
}

variable "ebs_throughput" {
  type        = number
  description = "throughput (MiB) of the ebs volumes - valid range between 125 and 1000"
  default     = 125
}

variable "ebs_volume_size" {
  type        = number
  description = "size of the volumes attached to each node (GB)"
  default     = 10
}

variable "ebs_volume_type" {
  type        = string
  description = "type of ebs volumes"
  default     = "gp3"
}

variable "enforce_https" {
  type        = bool
  description = "enforce traffic to be over https protocol only"
  default     = true
}

variable "engine_version" {
  type        = string
  description = "the opensearch engine version"
}

variable "instance_count" {
  type        = number
  description = "number of instances in the domain cluster"
}

variable "instance_type" {
  type        = string
  description = "type of instance of the domain cluster"
}

variable "security_group_ids" {
  type        = set(string)
  description = "id of the security group(s) to associate with the cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "ids of the target subnet(s) for the opensearch cluster deployment"
}

variable "warm_count" {
  type        = number
  description = "number of warm nodes in the domain cluster"
  default     = null
}

variable "warm_enabled" {
  type        = bool
  description = "whether to enable warm storage"
  default     = false
}

variable "warm_type" {
  type        = string
  description = "instance type for warm nodes - valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search"
  default     = null
}

variable "zone_awareness_enabled" {
  type        = bool
  description = "enable multi-availability zone deployments"
}

variable "tags" {
  type        = map(string)
  description = "tags to apply to the load balancer and listeners (if created)"
  default     = {}
}