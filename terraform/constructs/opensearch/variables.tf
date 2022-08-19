##################################
#  Required Variables ############
##################################

variable "app" {
  type        = string
  description = "The name of the application, often times an acronym in all lower case characters (i.e. 'mtp')"
}

variable "engine_version" {
  type        = string
  description = "The engine version of the OpenSearch cluster (i.e. '1.2')"
}

variable "hot_node_count" {
  type        = number
  description = "The number of hot data nodes to provision to the cluster"
}

variable "hot_node_type" {
  type        = string
  description = "The instance type to provision for the hot data nodes in the cluster (i.e m6g.large.search)"
}

variable "master_node_count" {
  type        = number
  description = "The number of dedicated master nodes to support the cluster"
}

variable "master_node_enabled" {
  type        = bool
  description = "Set to true to provision dedicated master nodes for the cluster"
}

variable "master_node_type" {
  type        = string
  description = "The instance type to provision for the dedicated master nodes in the cluster (i.e m6g.large.search)"
}

variable "multi_az" {
  type        = bool
  description = "Set to true to distribute cluster resources across multiple availability zones"
}

variable "program" {
  type        = string
  description = "The name of the program this app or project supports (i.e. ccdi)"
}

variable "subnet_ids" {
  type        = set(string)
  description = "The subnets which OpenSearch will be deployed to"
}

variable "tier" {
  type        = string
  description = "The target tier for the deployment. If using workspaces, provide 'terraform.workspace' when providing a value for this variable"
}