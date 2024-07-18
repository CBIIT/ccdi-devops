![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage

The following template represents the minimum configuration required to implement the module.

<pre><code>
module "opensearch" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/opensearch?ref=v?.?.?"

  app                       = 
  availability_zone_count   = 
  dedicated_master_count    = 
  dedicated_master_enabled  = 
  dedicated_master_type     = 
  engine_version            = 
  instance_count            = 
  instance_type             = 
  subnet_ids                = 
  vpc_id                    = 
}
</code></pre>


The following template represents all arguments available to configure the module.

<pre><code>
module "opensearch" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/opensearch?ref=v?.?.?"

  app                              = 
  automated_snapshot_start_hour    = 
  availability_zone_count          = 
  cloudwatch_log_retention_in_days = 
  cold_storage_enabled             = 
  create_domain_policy             = 
  create_security_group            = 
  custom_endpoint_certificate_arn  = 
  custom_endpoint                  = 
  custom_endpoint_enabled          = 
  dedicated_master_count           = 
  dedicated_master_enabled         = 
  dedicated_master_type            = 
  domain_name_suffix               = 
  ebs_enabled                      = 
  ebs_iops                         = 
  ebs_throughput                   = 
  ebs_volume_size                  = 
  ebs_volume_type                  = 
  engine_version                   = 
  env                              = 
  instance_count                   = 
  instance_type                    = 
  program                          = 
  security_group_ids               = []
  subnet_ids                       = []
  vpc_id                           = 
  warm_count                       = 
  warm_enabled                     = 
  warm_type                        = 
}
</code></pre>
<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_opensearch_domain_policy"></a> [opensearch\_domain\_policy](#module\_opensearch\_domain\_policy) | git::https://github.com/CBIIT/ccdi-devops//terraform/aws/modules/opensearch-domain-policy | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.error](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.index_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.search_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_opensearch_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_automated_snapshot_start_hour"></a> [automated\_snapshot\_start\_hour](#input\_automated\_snapshot\_start\_hour) | the hour in which snapshots will occur | `number` | `22` | no |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | number of availability zones for the domain to use | `number` | n/a | yes |
| <a name="input_cloudwatch_log_retention_in_days"></a> [cloudwatch\_log\_retention\_in\_days](#input\_cloudwatch\_log\_retention\_in\_days) | number of days to retain cloudwatch logs | `number` | `90` | no |
| <a name="input_cold_storage_enabled"></a> [cold\_storage\_enabled](#input\_cold\_storage\_enabled) | whether to enable cold storage - master and ultrawarm nodes but be enabled for cold storage to be compatible | `bool` | `false` | no |
| <a name="input_create_domain_policy"></a> [create\_domain\_policy](#input\_create\_domain\_policy) | create domain policy that allows aws principles to perform http requests to the domain | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | whether to create a security group with default ingress and egress rules | `bool` | `true` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | fully-qualified domain for the custom endpoint | `bool` | `null` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | the arn of the certificate to use for the custom endpoint | `string` | `null` | no |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | create custom endpoint for the domain cluster | `bool` | `false` | no |
| <a name="input_dedicated_master_count"></a> [dedicated\_master\_count](#input\_dedicated\_master\_count) | number of dedicated master nodes in the cluster | `number` | n/a | yes |
| <a name="input_dedicated_master_enabled"></a> [dedicated\_master\_enabled](#input\_dedicated\_master\_enabled) | whether dedicated master nodes are turned-on for the cluster | `bool` | n/a | yes |
| <a name="input_dedicated_master_type"></a> [dedicated\_master\_type](#input\_dedicated\_master\_type) | type of dedicated master nodes for the cluster | `string` | n/a | yes |
| <a name="input_domain_name_suffix"></a> [domain\_name\_suffix](#input\_domain\_name\_suffix) | the domain name suffix that follows the stack name | `string` | `"opensearch"` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | whether to attach ebs volumes to the domain | `bool` | `true` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | baseline input/output (I/O) performance of the ebs volumes attached to each node | `number` | `3000` | no |
| <a name="input_ebs_throughput"></a> [ebs\_throughput](#input\_ebs\_throughput) | throughput (MiB) of the ebs volumes - valid range between 125 and 1000 | `number` | `125` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | size of the volumes attached to each node (GB) | `number` | `10` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | type of ebs volumes | `string` | `"gp3"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | the opensearch engine version | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | number of instances in the domain cluster | `number` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | type of instance of the domain cluster | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | id of the security group(s) to associate with the cluster - required if create\_security\_group is false | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | ids of the target subnet(s) for the opensearch cluster deployment | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of the vpc the cluster is deployed to | `string` | n/a | yes |
| <a name="input_warm_count"></a> [warm\_count](#input\_warm\_count) | number of warm nodes in the domain cluster | `number` | `null` | no |
| <a name="input_warm_enabled"></a> [warm\_enabled](#input\_warm\_enabled) | whether to enable warm storage | `bool` | `false` | no |
| <a name="input_warm_type"></a> [warm\_type](#input\_warm\_type) | instance type for warm nodes - valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search | `string` | `null` | no |
| <a name="input_zone_awareness_enabled"></a> [zone\_awareness\_enabled](#input\_zone\_awareness\_enabled) | whether to enable zone awareness | `bool` | `false` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the opensearch domain |
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | domain\_id of the opensearch domain |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | domain name of the opensearch domain |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | domain-specific endpoint used to submit index, search, and data upload requests |
| <a name="output_id"></a> [id](#output\_id) | id of the opensearch domain |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | arn of the security group if created by this module |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | id of the security group if created by this module |
<!-- END_TF_DOCS -->