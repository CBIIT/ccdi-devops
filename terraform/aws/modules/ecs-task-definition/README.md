![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage 

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
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | provide the json document that defines the container definitions for this task | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | number of cpu units used by the task | `string` | n/a | yes |
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | ust be set to either 'X86\_64' or 'ARM64' | `string` | `"X86_64"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | arn of the role the task assigns to the ECS container agent and the Docker daemon | `string` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | amount (MiB) of memory used by the task | `string` | n/a | yes |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | name of the microservice this task supports - i.e. backend, frontend, files | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | docker networking mode to use for the containers in the task - either 'host', 'bridge', 'awsvpc' or 'none' | `string` | `"awsvpc"` | no |
| <a name="input_operating_system_family"></a> [operating\_system\_family](#input\_operating\_system\_family) | if requires\_compatibilities is FARGATE this field is required | `string` | `"LINUX"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | et of launch types required by the task - can be 'EC2' and/or 'FARGATE' | `set(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | arn of role the task uses to call other aws services | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the task definition |
| <a name="output_family"></a> [family](#output\_family) | task definition family |
| <a name="output_id"></a> [id](#output\_id) | task definition id |
| <a name="output_revision"></a> [revision](#output\_revision) | task definition revision |
<!-- END_TF_DOCS -->