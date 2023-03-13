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
| [aws_kinesis_firehose_delivery_stream.kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_buffer_interval"></a> [buffer\_interval](#input\_buffer\_interval) | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination | `number` | `60` | no |
| <a name="input_buffer_size"></a> [buffer\_size](#input\_buffer\_size) | Buffer incoming data to the specified size, in MBs, before delivering it to the destination | `number` | `1` | no |
| <a name="input_content_encoding"></a> [content\_encoding](#input\_content\_encoding) | Kinesis Data Firehose uses the content encoding to compress the body of a request before sending the request to the destination - valid values are NONE and GZIP | `string` | `"GZIP"` | no |
| <a name="input_delivery_stream_suffix"></a> [delivery\_stream\_suffix](#input\_delivery\_stream\_suffix) | a suffix to append to the resource name after the stack name | `string` | `"newrelic-metric-delivery-stream"` | no |
| <a name="input_destination"></a> [destination](#input\_destination) | the destination to where the data is delivered. The only options are 'extended\_s3', 'redshift', 'elasticsearch', and 'http\_endpoint' | `string` | `"http_endpoint"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_http_endpoint_access_key"></a> [http\_endpoint\_access\_key](#input\_http\_endpoint\_access\_key) | access key required for Kinesis Firehose to authenticate with the HTTP endpoint selected as the destination | `string` | n/a | yes |
| <a name="input_http_endpoint_name"></a> [http\_endpoint\_name](#input\_http\_endpoint\_name) | The HTTP endpoint name | `string` | `"New Relic"` | no |
| <a name="input_http_endpoint_url"></a> [http\_endpoint\_url](#input\_http\_endpoint\_url) | The HTTP endpoint URL to which Kinesis Firehose sends your data | `string` | `"https://aws-api.newrelic.com/cloudwatch-metrics/v1"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | arn of the role for cloudwatch metric stream to assume | `string` | n/a | yes |
| <a name="input_s3_backup_mode"></a> [s3\_backup\_mode](#input\_s3\_backup\_mode) | Defines how documents should be delivered to Amazon S3. Valid values are 'FailedDataOnly' and 'AllData' | `string` | `"FailedDataOnly"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | The arn of the S3 bucket where failed message deliveries to New Relic are delivered | `string` | n/a | yes |
| <a name="input_s3_compression_format"></a> [s3\_compression\_format](#input\_s3\_compression\_format) | File compression format - values are 'GZIP', 'ZIP', 'Snappy', & 'HADOOP\_SNAPPY' | `string` | `"UNCOMPRESSED"` | no |
| <a name="input_s3_error_output_prefix"></a> [s3\_error\_output\_prefix](#input\_s3\_error\_output\_prefix) | Prefix added to failed records before writing them to S3 - immediately follows bucket name | `string` | `null` | no |
| <a name="input_s3_object_prefix"></a> [s3\_object\_prefix](#input\_s3\_object\_prefix) | The 'YYYY/MM/DD/HH' time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix | `string` | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the kinesis firehose delivery stream |
| <a name="output_destination"></a> [destination](#output\_destination) | destination of data processed through the kinesis firehose delivery stream |
| <a name="output_id"></a> [id](#output\_id) | id of the kinesis firehose delivery stream |
| <a name="output_name"></a> [name](#output\_name) | name of the kinesis firehose delivery stream |
| <a name="output_version_id"></a> [version\_id](#output\_version\_id) | version id of the kinesis firehose delivery stream |
<!-- END_TF_DOCS -->