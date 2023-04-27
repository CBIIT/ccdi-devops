![Frederick National Laboratory](./assets/fnl.svg)

# Overview

A module that creates an AWS Config Recorder resource, an AWS Config Delivery Channel resource, and an IAM Role that is assumed by the AWS Config service. The Config Recorder resource defines the scope of services that the Config service can monitor. The default value (expressed as a list) for the variable `recording_group_resource_types` defines the scope for all services that we want to monitor, and ommits resources that are either (a) not relevant; or (b) not managed by FNL/CTOS and do not relate to services managed by FNL/CTOS.

# Usage 

# Usage

As a best practice, consider using the values of `nonprod` or `prod` for the argument passed to the module called `env`, rather than providing the `terraform.workspace`. See examples for more information.

## Module Template

The following provides an example of how to use this module by defining values for all required and optional variables. Remember to pin the release version using the `?ref` reference trailing the url in the `source` argument.

<pre><code>module "config_recorder" {
    source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/config-recorder?ref=v?.?.?"

    app                             =
    attach_permissions_boundary     =
    config_s3_bucket_name           =
    enable_config                   =
    env                             =
    program                         =
    recording_group_resource_types  =
}</code></pre>

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

# Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_role"></a> [role](#module\_role) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/config-recorder | v3.0.12 |

# Resources

| Name | Type |
|------|------|
| [aws_config_configuration_recorder.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether or not to attach a permissions boundary to the role created for the config service | `bool` | n/a | yes |
| <a name="input_config_s3_bucket_name"></a> [config\_s3\_bucket\_name](#input\_config\_s3\_bucket\_name) | the name of the s3 bucket to store aws config data | `string` | n/a | yes |
| <a name="input_enable_config"></a> [enable\_config](#input\_enable\_config) | whether to enable aws config | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_recording_group_resouce_types"></a> [recording\_group\_resouce\_types](#input\_recording\_group\_resouce\_types) | the resource types to record | `list(string)` | <pre>[<br>  "AWS::ACM::Certificate",<br>  "AWS::ApiGateway::RestApi",<br>  "AWS::ApiGateway::Stage",<br>  "AWS::ApiGatewayV2::Api",<br>  "AWS::ApiGatewayV2::Stage",<br>  "AWS::Athena::DataCatalog",<br>  "AWS::Athena::WorkGroup",<br>  "AWS::AutoScaling::AutoScalingGroup",<br>  "AWS::AutoScaling::LaunchConfiguration",<br>  "AWS::AutoScaling::ScalingPolicy",<br>  "AWS::Backup::BackupPlan",<br>  "AWS::Backup::BackupSelection",<br>  "AWS::Backup::BackupVault",<br>  "AWS::Backup::RecoveryPoint",<br>  "AWS::Backup::ReportPlan",<br>  "AWS::CloudFormation::Stack",<br>  "AWS::CloudFront::Distribution",<br>  "AWS::CloudTrail::Trail",<br>  "AWS::CloudWatch::Alarm",<br>  "AWS::Config::ConformancePackCompliance",<br>  "AWS::Config::ResourceCompliance",<br>  "AWS::DynamoDB::Table",<br>  "AWS::EC2::DHCPOptions",<br>  "AWS::EC2::EgressOnlyInternetGateway",<br>  "AWS::EC2::EIP",<br>  "AWS::EC2::Host",<br>  "AWS::EC2::Instance",<br>  "AWS::EC2::InternetGateway",<br>  "AWS::EC2::IPAM",<br>  "AWS::EC2::NatGateway",<br>  "AWS::EC2::NetworkInterface",<br>  "AWS::EC2::RouteTable",<br>  "AWS::EC2::SecurityGroup",<br>  "AWS::EC2::Subnet",<br>  "AWS::EC2::TransitGateway",<br>  "AWS::EC2::TransitGatewayAttachment",<br>  "AWS::EC2::TransitGatewayRouteTable",<br>  "AWS::EC2::Volume",<br>  "AWS::EC2::VPC",<br>  "AWS::EC2::VPCEndpoint",<br>  "AWS::EC2::VPCEndpointService",<br>  "AWS::ECR::RegistryPolicy",<br>  "AWS::ECR::Repository",<br>  "AWS::ECS::Cluster",<br>  "AWS::ECS::Service",<br>  "AWS::ECS::TaskDefinition",<br>  "AWS::EFS::AccessPoint",<br>  "AWS::EFS::FileSystem",<br>  "AWS::ElasticLoadBalancing::LoadBalancer",<br>  "AWS::ElasticLoadBalancingV2::Listener",<br>  "AWS::ElasticLoadBalancingV2::LoadBalancer",<br>  "AWS::Elasticsearch::Domain",<br>  "AWS::Events::ApiDestination",<br>  "AWS::Events::Archive",<br>  "AWS::Events::Connection",<br>  "AWS::Events::Endpoint",<br>  "AWS::Events::EventBus",<br>  "AWS::Events::Rule",<br>  "AWS::Glue::Classifier",<br>  "AWS::Glue::Job",<br>  "AWS::Glue::MLTransform",<br>  "AWS::IAM::Group",<br>  "AWS::IAM::Policy",<br>  "AWS::IAM::Role",<br>  "AWS::IAM::User",<br>  "AWS::Kinesis::Stream",<br>  "AWS::Kinesis::StreamConsumer",<br>  "AWS::KinesisAnalyticsV2::Application",<br>  "AWS::KMS::Key",<br>  "AWS::Lambda::Function",<br>  "AWS::NetworkManager::TransitGatewayRegistration",<br>  "AWS::OpenSearch::Domain",<br>  "AWS::RDS::DBCluster",<br>  "AWS::RDS::DBClusterSnapshot",<br>  "AWS::RDS::DBInstance",<br>  "AWS::RDS::DBSecurityGroup",<br>  "AWS::RDS::DBSnapshot",<br>  "AWS::RDS::DBSubnetGroup",<br>  "AWS::RDS::GlobalCluster",<br>  "AWS::S3::AccountPublicAccessBlock",<br>  "AWS::S3::Bucket",<br>  "AWS::S3::MultiRegionAccessPoint",<br>  "AWS::S3::StorageLens",<br>  "AWS::SecretsManager::Secret",<br>  "AWS::SES::ConfigurationSet",<br>  "AWS::SES::ContactList",<br>  "AWS::SES::ReceiptFilter",<br>  "AWS::SES::ReceiptRuleSet",<br>  "AWS::SES::Template",<br>  "AWS::SNS::Topic",<br>  "AWS::SQS::Queue",<br>  "AWS::SSM::FileData",<br>  "AWS::StepFunctions::Activity",<br>  "AWS::StepFunctions::StateMachine",<br>  "AWS::WAF::RateBasedRule",<br>  "AWS::WAF::Rule",<br>  "AWS::WAF::RuleGroup",<br>  "AWS::WAF::WebACL",<br>  "AWS::WAFRegional::RateBasedRule",<br>  "AWS::WAFRegional::Rule",<br>  "AWS::WAFRegional::RuleGroup",<br>  "AWS::WAFRegional::WebACL",<br>  "AWS::WAFv2::IPSet",<br>  "AWS::WAFv2::ManagedRuleSet",<br>  "AWS::WAFv2::RegexPatternSet",<br>  "AWS::WAFv2::RuleGroup",<br>  "AWS::WAFv2::WebACL"<br>]</pre> | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the aws config configuration recorder |
| <a name="output_name"></a> [name](#output\_name) | name of the aws config configuration recorder |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | arn of the aws config configuration recorder role |
<!-- END_TF_DOCS -->
