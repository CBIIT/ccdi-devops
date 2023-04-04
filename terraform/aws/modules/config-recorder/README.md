<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

# Resources

| Name | Type |
|------|------|
| [aws_config_configuration_recorder.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.aws_managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_config_s3_bucket_name"></a> [config\_s3\_bucket\_name](#input\_config\_s3\_bucket\_name) | the name of the s3 bucket to store aws config data | `string` | n/a | yes |
| <a name="input_enable_config"></a> [enable\_config](#input\_enable\_config) | whether to enable aws config | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_recording_group_resouce_types"></a> [recording\_group\_resouce\_types](#input\_recording\_group\_resouce\_types) | the resource types to record | `list(string)` | <pre>[<br>  "AWS::AutoScaling::AutoScalingGroup",<br>  "AWS::AutoScaling::ScalingPolicy",<br>  "AWS::AutoScaling::ScheduledAction",<br>  "AWS::ACM::Certificate",<br>  "AWS::CloudFront::Distribution",<br>  "AWS::CloudTrail::Trail",<br>  "AWS::CloudWatch::Alarm",<br>  "AWS::EC2::Host",<br>  "AWS::EC2::Instance",<br>  "AWS::EC2::SecurityGroup",<br>  "AWS::EC2::Volume",<br>  "AWS::EC2::VPC",<br>  "AWS::ECR::Repository",<br>  "AWS::ECR::RegistryPolicy",<br>  "AWS::ECS::Cluster",<br>  "AWS::ECS::Service",<br>  "AWS::ECS::TaskDefinition",<br>  "AWS::ElasticLoadBalancingV2::LoadBalancer",<br>  "AWS::ElasticLoadBalancingV2::Listener",<br>  "AWS::ElasticSearch::Domain",<br>  "AWS::IAM::Policy",<br>  "AWS::IAM::Role",<br>  "AWS::Kinesis::Stream",<br>  "AWS::KMS::Key",<br>  "AWS::Lambda::Function",<br>  "AWS::OpenSearch::Domain",<br>  "AWS::RDS::DBCluster",<br>  "AWS::RDS::DBClusterSnapshot",<br>  "AWS::RDS::DBInstance",<br>  "AWS::RDS::DBSecurityGroup",<br>  "AWS::RDS::DBSnapshot",<br>  "AWS::RDS::DBSubnetGroup",<br>  "AWS::SecretsManager::Secret",<br>  "AWS::SQS::Queue",<br>  "AWS::S3::Bucket",<br>  "AWS::S3::AccountPublicAccessBlock"<br>]</pre> | no |
<!-- END_TF_DOCS -->