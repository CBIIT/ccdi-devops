![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage 

<pre><code>
module "ecs_task_definition_frontend" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecs-task-definition?ref=v3.0.4"

  app                      = 
  env                      = 
  program                  = 
  container_definitions    = 
  cpu                      = 
  cpu_architecture         = 
  execution_role_arn       = 
  memory                   = 
  network_mode             = 
  operating_system_family  = 
  requires_compatibilities = []
  microservice             = 
  task_role_arn            = 
}
</code></pre>

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

# Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_container_environment_variables"></a> [container\_environment\_variables](#input\_container\_environment\_variables) | map of environment variables to pass to the container | `map(string)` | `{}` | no |
| <a name="input_container_image_url"></a> [container\_image\_url](#input\_container\_image\_url) | provide the ecr repository url for the microservice container image | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | number of cpu units used by the task | `string` | `"2048"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | arn of the role the task assigns to the ECS container agent and the Docker daemon | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | amount (MiB) of memory used by the task | `number` | `"2048"` | no |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | name of the microservice this task supports - i.e. backend, frontend, files | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | port the microservice listens on | `number` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_secret_arn"></a> [secret\_arn](#input\_secret\_arn) | arn of the secret that contains the newrelic license key (NRIA\_LICENSE\_KEY) | `string` | n/a | yes |
| <a name="input_sumo_collector_token"></a> [sumo\_collector\_token](#input\_sumo\_collector\_token) | sumologic collector token | `string` | n/a | yes |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | arn of role the task uses to call other aws services | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the task definition |
| <a name="output_family"></a> [family](#output\_family) | task definition family |
| <a name="output_id"></a> [id](#output\_id) | task definition id |
| <a name="output_revision"></a> [revision](#output\_revision) | task definition revision |
<!-- END_TF_DOCS -->