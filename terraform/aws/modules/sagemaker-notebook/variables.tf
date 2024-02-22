variable "attach_permissions_boundary" {
  type        = bool
  description = "Whether to attach a permissions boundary to the IAM role if the iam role is created"
  default     = false
  sensitive   = false
}

variable "create_iam_role" {
  type        = bool
  description = "Whether to create an IAM role for the notebook instance"
  default     = true
  sensitive   = false
}

variable "create_lifecycle_config" {
  type        = bool
  description = "Whether to create a lifecycle configuration for the notebook instance"
  default     = true
  sensitive   = false
}

variable "direct_internet_access" {
  type        = string
  description = "Whether the notebook instance is directly accessible via the internet. The default value is Disabled"
  default     = "Disabled"
  sensitive   = false
}

variable "graph_notebook_auth_mode" {
  type        = string
  description = "The authentication mode to use when connecting to the Neptune Cluster"
  default     = "DEFAULT"
  sensitive   = false
}

variable "graph_notebook_host" {
  type        = string
  description = "The endpoint for the Neptune Cluster that this notebook instance will connect to"
  sensitive   = false
}

variable "graph_notebook_port" {
  type        = number
  description = "The port number on which the notebook server will listen"
  default     = 8182
  sensitive   = false
}

variable "iam_prefix" {
  type        = string
  description = "The prefix to use for the name of the IAM role that is created"
  default     = "power-user"
  sensitive   = false
}

variable "instance_type" {
  type        = string
  description = "The type of ML compute instance to launch for the notebook instance"
  default     = "ml.t3.medium"
  sensitive   = false
}

variable "minimum_instance_metadata_service_version" {
  type        = number
  description = "The minimum version of the instance metadata service to use for the notebook instance"
  default     = 2
  sensitive   = false
}

variable "neptune_cluster_id" {
  type        = string
  description = "The ID of the Neptune Cluster that this notebook instance will connect to"
  sensitive   = false
}

variable "neptune_resource_id" {
  type        = string
  description = "The resource ID of the Neptune Cluster that this notebook instance will connect to"
  sensitive   = false
}

variable "platform_identifier" {
  type        = string
  description = "The identifier of the notebook instance platform."
  default     = "notebook-al2-v2"
  sensitive   = false
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use for the name of the resources that are created"
  sensitive   = false
}

variable "role_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the IAM role to associate with the instance - use if create_iam_role is false"
  default     = null
  sensitive   = false
}

variable "root_access" {
  type        = string
  description = "Whether root access is enabled or disabled for the notebook instance. The default value is Disabled"
  default     = "Disabled"
  sensitive   = false
}

variable "security_groups" {
  type        = set(string)
  description = "The security group IDs to associate with the instance"
  default     = []
  sensitive   = false
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID in which to launch the instance"
  default     = null
  sensitive   = false
}

variable "volume_size" {
  type        = number
  description = "The size of the EBS volume, in GB"
  default     = 5
  sensitive   = false
}
