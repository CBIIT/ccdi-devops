<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_inventory.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_inventory) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | the name of the bucket | `string` | n/a | yes |
| <a name="input_destination_bucket_arn"></a> [destination\_bucket\_arn](#input\_destination\_bucket\_arn) | arn of the bucket to which the inventory will be delivered | `string` | n/a | yes |
| <a name="input_destination_format"></a> [destination\_format](#input\_destination\_format) | the format of the inventory | `string` | `"CSV"` | no |
| <a name="input_filter_prefix"></a> [filter\_prefix](#input\_filter\_prefix) | the prefix to be applied to the inventory (e.g. 'logs/') | `string` | `null` | no |
| <a name="input_included_object_versions"></a> [included\_object\_versions](#input\_included\_object\_versions) | the object versions to be included in the inventory | `string` | `"All"` | no |
| <a name="input_schedule_frequency"></a> [schedule\_frequency](#input\_schedule\_frequency) | the frequency of the inventory | `string` | `"Daily"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the inventory configuration |
| <a name="output_name"></a> [name](#output\_name) | name of the inventory configuration |
<!-- END_TF_DOCS -->