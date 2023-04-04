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

variable "config_s3_bucket_name" {
  type        = string
  description = "the name of the s3 bucket to store aws config data"
  sensitive   = false
}

variable "enable_config" {
  type        = bool
  description = "whether to enable aws config"
  default     = true
  sensitive   = false
}

variable "recording_group_resouce_types" {
  type        = list(string)
  description = "the resource types to record"
  default     = [
    "AWS::AutoScaling::AutoScalingGroup",
    "AWS::AutoScaling::ScalingPolicy",
    "AWS::AutoScaling::ScheduledAction",
    "AWS::ACM::Certificate",
    "AWS::CloudFront::Distribution",
    "AWS::CloudTrail::Trail",
    "AWS::CloudWatch::Alarm",
    "AWS::EC2::Host",
    "AWS::EC2::Instance",
    "AWS::EC2::NetworkInterface",
    "AWS::EC2::RouteTable",
    "AWS::EC2::SecurityGroup",
    "AWS::EC2::Subnet",
    "AWS::EC2::Volume",
    "AWS::EC2::VPC",
    "AWS::ECR::Repository",
    "AWS::ECR::RegistryPolicy",
    "AWS::ECS::Cluster", 
    "AWS::ECS::Service",
    "AWS::ECS::TaskDefinition",
    "AWS::ElasticLoadBalancingV2::LoadBalancer",
    "AWS::ElasticLoadBalancingV2::Listener",
    "AWS::ElasticSearch::Domain",
    "AWS::IAM::Policy",
    "AWS::IAM::Role",
    "AWS::Kinesis::Stream",
    "AWS::KMS::Key",
    "AWS::Lambda::Function",
    "AWS::OpenSearch::Domain",
    "AWS::RDS::DBCluster",
    "AWS::RDS::DBClusterSnapshot",
    "AWS::RDS::DBInstance",
    "AWS::RDS::DBSecurityGroup",
    "AWS::RDS::DBSnapshot",
    "AWS::RDS::DBSubnetGroup",
    "AWS::SecretsManager::Secret",
    "AWS::SQS::Queue",
    "AWS::S3::Bucket",
    "AWS::S3::AccountPublicAccessBlock"
  ]
  sensitive   = false
}