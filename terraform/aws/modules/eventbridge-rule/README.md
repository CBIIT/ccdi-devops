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
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | description of the rule | `string` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | whether to enable the rule | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | name of the event bus to create the rule on | `string` | `"default"` | no |
| <a name="input_event_pattern"></a> [event\_pattern](#input\_event\_pattern) | event pattern for the rule | `any` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | arn of the role to use for the rule to support target invocation | `string` | `null` | no |
| <a name="input_rule_suffix"></a> [rule\_suffix](#input\_rule\_suffix) | suffix to append to the rule name after the stack name | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | schedule expression (cron) for the rule | `string` | `null` | no |
| <a name="input_trigger_type"></a> [trigger\_type](#input\_trigger\_type) | type of trigger for the rule - either 'schedule or 'event\_pattern' | `string` | `"event_pattern"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the eventbridge rule |
| <a name="output_id"></a> [id](#output\_id) | id of the eventbridge rule |
| <a name="output_name"></a> [name](#output\_name) | name of the eventbridge rule |
<!-- END_TF_DOCS -->