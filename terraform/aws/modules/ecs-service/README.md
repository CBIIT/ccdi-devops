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
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | id of the cluster associated with the service | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | name of the container this service hosts | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | the port exposed for the container for inbound traffic | `number` | n/a | yes |
| <a name="input_deployment_controller_type"></a> [deployment\_controller\_type](#input\_deployment\_controller\_type) | n/a | `string` | `"ECS"` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment | `number` | `500` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment | `number` | `100` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | desired number of containers for the service to run | `number` | `1` | no |
| <a name="input_enable_ecs_managed_tags"></a> [enable\_ecs\_managed\_tags](#input\_enable\_ecs\_managed\_tags) | whether to enable Amazon ECS managed tags for the tasks within the service | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | number of seconds to wait until evaluating that a deployment is unhealthy | `number` | `300` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | launch type of the service - either EC2, FARGATE, or EXTERNAL | `string` | `"FARGATE"` | no |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | the name to microservice that this ecs service orchestrates (i.e. 'frontend') | `string` | n/a | yes |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | platform version on which to run your service - only applicable for launch\_type set to FARGATE | `string` | `"1.4.0"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_propagate_tags"></a> [propagate\_tags](#input\_propagate\_tags) | determines whether tasks inherit tags from the TASK\_DEFINITION or the SERVICE | `string` | `"SERVICE"` | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | scheduling strategy to use for the service - either 'REPLICA' or 'DAEMON' (later not supported by Fargate) | `string` | `"REPLICA"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | arns of the security groups to attach to ecs services | `set(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | ids of the target subnets for the ecs deployment | `set(string)` | n/a | yes |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | arn of the associated target group for the services | `string` | n/a | yes |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | arn of the task definition associated with the service | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the service |
| <a name="output_name"></a> [name](#output\_name) | name of the service |
<!-- END_TF_DOCS -->