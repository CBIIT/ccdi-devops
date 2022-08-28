<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the associated cluster (i.e. aws\_ecs\_cluster.cluster.name) | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the associated service (i.e. aws\_ecs\_service.service.name) | `string` | n/a | yes |
<!-- END_TF_DOCS -->