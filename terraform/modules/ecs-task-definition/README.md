<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the application, use abbreviation (i.e. mtp) | `string` | n/a | yes |
| <a name="input_container_definition_essential"></a> [container\_definition\_essential](#input\_container\_definition\_essential) | n/a | `string` | n/a | yes |
| <a name="input_container_definition_image"></a> [container\_definition\_image](#input\_container\_definition\_image) | n/a | `string` | n/a | yes |
| <a name="input_container_definition_name"></a> [container\_definition\_name](#input\_container\_definition\_name) | n/a | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | n/a | `any` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Number of CPU units consumed by the task | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume | `string` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | A unique name for the task definition | `string` | n/a | yes |
| <a name="input_host_port"></a> [host\_port](#input\_host\_port) | n/a | `any` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount (in MiB) of memory used by the task | `string` | n/a | yes |
<!-- END_TF_DOCS -->