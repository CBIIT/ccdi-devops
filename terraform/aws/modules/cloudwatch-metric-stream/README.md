![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage

<pre><code>
module "cloudwatch_metric_stream" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/cloudwatch-metric-stream?ref=v?.?.?"

  app             = 
  env             = 
  program         = 
  firehose_arn    = 
  include_filter  = []
  output_format   = 
  resource_suffix = 
  role_arn        = 
}
</code></pre>

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
| [aws_cloudwatch_metric_stream.cw_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_stream) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_firehose_arn"></a> [firehose\_arn](#input\_firehose\_arn) | arn of the kinesis firehose delivery stream to use for the metric stream | `string` | n/a | yes |
| <a name="input_include_filter"></a> [include\_filter](#input\_include\_filter) | Specify the service namespaces to include in metric stream in a list | `set(string)` | <pre>[<br>  "AWS/ES",<br>  "AWS/ApplicationELB",<br>  "AWS/ECS"<br>]</pre> | no |
| <a name="input_output_format"></a> [output\_format](#input\_output\_format) | output format of the metric stream data - either 'json' or 'opentelemetry0.7' | `string` | `"opentelemetry0.7"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_resource_suffix"></a> [resource\_suffix](#input\_resource\_suffix) | a suffix to append to the resource name after the stack name | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | arn of the role for cloudwatch metric stream to assume | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the metric stream |
| <a name="output_id"></a> [id](#output\_id) | id of the metric stream |
| <a name="output_name"></a> [name](#output\_name) | name of the metric stream |
| <a name="output_state"></a> [state](#output\_state) | state of the metric stream - either 'ACTIVE' or 'CREATING' |
<!-- END_TF_DOCS -->