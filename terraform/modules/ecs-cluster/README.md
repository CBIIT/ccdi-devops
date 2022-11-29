<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the application, often times an acronym in all lower case characters (i.e. 'mtp') | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | The name of the program that the ALB belongs to | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | n/a | yes |
| <a name="input_container_insights_enabled"></a> [container\_insights\_enabled](#input\_container\_insights\_enabled) | Enables ECS container insights. Valid values are 'enabled' and 'disabled' | `string` | `"enabled"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->