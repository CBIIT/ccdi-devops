![Frederick National Laboratory](./assets/banner3.png)

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
| [aws_appautoscaling_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | name of the ecs cluster that the autoscaling target belongs to | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | name of the ecs service that the autoscaling target belongs to | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | max capacity of the scalable target | `number` | `4` | no |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | the name of the microservice for the app autoscaling policy and target - i.e. frontend, backend, etc. | `string` | n/a | yes |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | minimum capacity of the scalable target | `number` | `1` | no |
| <a name="input_policy_type"></a> [policy\_type](#input\_policy\_type) | scaling policy - either 'StepScaling' or 'TargetTrackingScaling' | `string` | `"TargetTrackingScaling"` | no |
| <a name="input_predefined_metric_type"></a> [predefined\_metric\_type](#input\_predefined\_metric\_type) | the name of the pre-defined aws cloudwatch metric type to base autoscaling activities on | `string` | `"ECSServiceAverageCPUUtilization"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_scalable_dimension"></a> [scalable\_dimension](#input\_scalable\_dimension) | calable dimension of the scalable target - use outputs from appautoscaling target resource | `string` | `"ecs:service:DesiredCount"` | no |
| <a name="input_service_namespace"></a> [service\_namespace](#input\_service\_namespace) | aws service namespace of the scalable target - use outputs from the appautoscaling target resource | `string` | `"ecs"` | no |
| <a name="input_target_value"></a> [target\_value](#input\_target\_value) | target value of the metric to invoke autoscaling activity | `number` | `80` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_alarm_arns"></a> [policy\_alarm\_arns](#output\_policy\_alarm\_arns) | n/a |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | n/a |
| <a name="output_policy_policy_type"></a> [policy\_policy\_type](#output\_policy\_policy\_type) | n/a |
| <a name="output_policy_resouce_id"></a> [policy\_resouce\_id](#output\_policy\_resouce\_id) | n/a |
| <a name="output_policy_scalable_dimension"></a> [policy\_scalable\_dimension](#output\_policy\_scalable\_dimension) | n/a |
| <a name="output_policy_service_namespace"></a> [policy\_service\_namespace](#output\_policy\_service\_namespace) | n/a |
| <a name="output_policy_target_tracking_scaling_policy_configuration"></a> [policy\_target\_tracking\_scaling\_policy\_configuration](#output\_policy\_target\_tracking\_scaling\_policy\_configuration) | n/a |
| <a name="output_target_id"></a> [target\_id](#output\_target\_id) | n/a |
| <a name="output_target_resource_id"></a> [target\_resource\_id](#output\_target\_resource\_id) | n/a |
| <a name="output_target_scalable_dimension"></a> [target\_scalable\_dimension](#output\_target\_scalable\_dimension) | n/a |
| <a name="output_target_service_namespace"></a> [target\_service\_namespace](#output\_target\_service\_namespace) | n/a |
<!-- END_TF_DOCS -->