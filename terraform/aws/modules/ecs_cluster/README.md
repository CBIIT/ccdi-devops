<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.36.1 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.36.1 |

# Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/4.36.1/docs/resources/ecs_cluster) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | name of the application | `string` | n/a | yes |
| <a name="input_container_insights_enabled"></a> [container\_insights\_enabled](#input\_container\_insights\_enabled) | Enables ECS container insights. Valid values are 'enabled' and 'disabled' | `string` | `"disabled"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | the tier or account level | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | abbreviation of the ctos program | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | the arn of the cluster |
| <a name="output_id"></a> [id](#output\_id) | the id is the same as the arn for the cluster |
| <a name="output_name"></a> [name](#output\_name) | the name of the cluster |
<!-- END_TF_DOCS -->