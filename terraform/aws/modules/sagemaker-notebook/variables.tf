variable "direct_internet_access" {
  type        = bool
  description = "Whether the notebook instance is directly accessible via the internet. The default value is Disabled"
  default     = false
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
  description = "The Amazon Resource Name (ARN) of the IAM role to associate with the instance. This is the role that has permissions to be able to access data sources and resources that you specify in your notebook instance"
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
