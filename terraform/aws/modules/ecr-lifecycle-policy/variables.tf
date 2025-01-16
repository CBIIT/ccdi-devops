variable "repository_name" {
  type        = string
  description = "the name of the ecr repository to associate the lifecycle policy with"
  sensitive   = false
}

variable "dev_image_limit" {
  type        = number
  description = "the number of non-prod images to retain in the repo"
  sensitive   = false
  default = 30
}

variable "prod_image_limit" {
  type        = number
  description = "the number of prod images to retain in the repo"
  sensitive   = false
  default = 10
}
