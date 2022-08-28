<!-- BEGIN_TF_DOCS -->
# Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the application that the load balancer belongs to | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | The name of the program this app or project supports (i.e. ccdi) | `string` | n/a | yes |
| <a name="input_target_description"></a> [target\_description](#input\_target\_description) | Describing the target, such as frontend or backend | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier or environment that the load balancer belongs to | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the target group | `string` | n/a | yes |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | n/a | `number` | `5` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | n/a | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | n/a | `string` | `"200"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | n/a | `string` | `"/"` | no |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | n/a | `string` | `"traffic-port"` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | n/a | `string` | `"HTTP"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | n/a | `number` | `10` | no |
| <a name="input_health_check_unhealthy_threshold"></a> [health\_check\_unhealthy\_threshold](#input\_health\_check\_unhealthy\_threshold) | n/a | `number` | `5` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
<!-- END_TF_DOCS -->