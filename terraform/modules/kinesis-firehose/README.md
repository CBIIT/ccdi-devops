<!-- BEGIN_TF_DOCS -->



# Resources

| Name | Type |
|------|------|
| [aws_iam_policy.kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.kinesis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |


# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Account ID for the deployment target - use 'data.aws\_caller\_identity.current.account\_id | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | The name of the application (i.e. 'mtp') | `string` | n/a | yes |

| <a name="input_buffer_interval"></a> [buffer\_interval](#input\_buffer\_interval) | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination | `number` | `60` | no |
| <a name="input_buffer_size"></a> [buffer\_size](#input\_buffer\_size) | Buffer incoming data to the specified size, in MBs, before delivering it to the destination | `number` | `1` | no |
| <a name="input_content_encoding"></a> [content\_encoding](#input\_content\_encoding) | Kinesis Data Firehose uses the content encoding to compress the body of a request before sending the request to the destination - valid values are NONE and GZIP | `string` | `"GZIP"` | no |
| <a name="input_destination"></a> [destination](#input\_destination) | the destination to where the data is delivered. The only options are extended\_s3, redshift, elasticsearch, and http\_endpoint | `string` | `"http_endpoint"` | no |
| <a name="input_s3_backup_mode"></a> [s3\_backup\_mode](#input\_s3\_backup\_mode) | Defines how documents should be delivered to Amazon S3. Valid values are FailedDataOnly and AllData | `string` | `"FailedDataOnly"` | no |
| <a name="input_s3_compression_format"></a> [s3\_compression\_format](#input\_s3\_compression\_format) | File compression format - values are 'GZIP', 'ZIP', 'Snappy', & 'HADOOP\_SNAPPY' | `string` | `"UNCOMPRESSED"` | no |
| <a name="input_s3_error_output_prefix"></a> [s3\_error\_output\_prefix](#input\_s3\_error\_output\_prefix) | Prefix added to failed records before writing them to S3 - immediately follows bucket name | `string` | `null` | no |
| <a name="input_s3_object_prefix"></a> [s3\_object\_prefix](#input\_s3\_object\_prefix) | The 'YYYY/MM/DD/HH' time format prefix is automatically used for delivered S3 files. You can specify an extra prefix to be added in front of the time format prefix | `string` | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
<!-- END_TF_DOCS -->