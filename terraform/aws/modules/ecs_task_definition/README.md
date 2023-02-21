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
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/4.36.1/docs/resources/ecs_task_definition) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | n/a | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Number of cpu units used by the task | `number` | `1024` | no |
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | The architecture of the host that containers run on | `string` | `"X86_64"` | no |
| <a name="input_descriptor"></a> [descriptor](#input\_descriptor) | backend, frontend, newrelic, etc | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume | `string` | n/a | yes |
| <a name="input_ipc_mode"></a> [ipc\_mode](#input\_ipc\_mode) | Not used for Fargate architectues | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount (in MiB) of memory used by the task | `number` | `2048` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Docker networking mode to use for the containers in the task | `string` | `"awsvpc"` | no |
| <a name="input_operating_system_family"></a> [operating\_system\_family](#input\_operating\_system\_family) | Type of operating system used by the containers | `string` | `"LINUX"` | no |
| <a name="input_pid_mode"></a> [pid\_mode](#input\_pid\_mode) | Not used for Fargate architectures | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | n/a | `string` | n/a | yes |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | Set of launch types required by the task | `set(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_skip_destroy"></a> [skip\_destroy](#input\_skip\_destroy) | Whether to retain the old revision when the resource is destroyed or replacement is necessary | `bool` | `false` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | n/a | `string` | n/a | yes |
<!-- END_TF_DOCS -->