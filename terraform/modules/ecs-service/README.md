<!-- BEGIN_TF_DOCS -->



# Resources

| Name | Type |
|------|------|
| [aws_ecs_service.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | n/a | `any` | n/a | yes |

| <a name="input_deployment_circuit_breaker_enable"></a> [deployment\_circuit\_breaker\_enable](#input\_deployment\_circuit\_breaker\_enable) | n/a | `bool` | `true` | no |
| <a name="input_deployment_circuit_breaker_rollback"></a> [deployment\_circuit\_breaker\_rollback](#input\_deployment\_circuit\_breaker\_rollback) | n/a | `bool` | `true` | no |
| <a name="input_deployment_controller_type"></a> [deployment\_controller\_type](#input\_deployment\_controller\_type) | n/a | `string` | `"ECS"` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | n/a | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | n/a | `number` | `50` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | n/a | `number` | `2` | no |

<!-- END_TF_DOCS -->