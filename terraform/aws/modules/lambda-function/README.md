![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage 



<pre><code>
module "lambda" {
  source = ""

  app                     = 
  description             = 
  env                     = 
  environment_variables   = {}
  filename                = 
  function_name           = 
  handler                 = 
  program                 = 
  role                    = 
  runtime                 = 
  subnet_ids              = []
  security_group_ids      = []
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

# Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_code_signing_config"></a> [code\_signing\_config](#module\_code\_signing\_config) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/lambda-code-signing-config | n/a |
| <a name="module_logs"></a> [logs](#module\_logs) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/cloudwatch-log-group | n/a |
| <a name="module_logs_key"></a> [logs\_key](#module\_logs\_key) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/kms | n/a |
| <a name="module_role"></a> [role](#module\_role) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/lambda-function | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | the architectures supported by the lambda function | `string` | `"x86_64"` | no |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether to attach a permission boundary to the iam role for lambda | `bool` | `false` | no |
| <a name="input_dead_letter_config_target_arn"></a> [dead\_letter\_config\_target\_arn](#input\_dead\_letter\_config\_target\_arn) | the arn of the dead letter queue to which lambda will send failed events | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | describe the purpose of the lambda function | `string` | n/a | yes |
| <a name="input_enable_log_encryption"></a> [enable\_log\_encryption](#input\_enable\_log\_encryption) | whether to enable encryption of logs in cloudwatch with kms | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | provide a map of key-value pairs to be used as environment variables for the lambda function | `map(string)` | `{}` | no |
| <a name="input_ephemeral_storage_size"></a> [ephemeral\_storage\_size](#input\_ephemeral\_storage\_size) | the amount of ephemeral storage available to the lambda function (MB) | `number` | `512` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | provide the path and name of the file that contains your lambda function code | `string` | `null` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | provide a name for the lambda function that will be appended to the stack name | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | the name of the handler function (for example, main.lambda\_handler) | `string` | n/a | yes |
| <a name="input_layers"></a> [layers](#input\_layers) | optionally provide a list of lambda layer arns to associate with the lambda function | `list(string)` | `[]` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | the amount of memory available to the lambda function | `number` | `128` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_publish"></a> [publish](#input\_publish) | whether to publish the lambda function as a new version | `bool` | `false` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | the language-specific environment specified in the runtime parameter | `string` | n/a | yes |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | the name of the s3 bucket that contains the lambda function code | `string` | `null` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | the path and name of the file that contains your lambda function code | `string` | `null` | no |
| <a name="input_signing_profile_version_arns"></a> [signing\_profile\_version\_arns](#input\_signing\_profile\_version\_arns) | optionally provide a list of signing profile version arns to associate with the lambda function | `list(string)` | `null` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | the base64-encoded sha256 hash of the package file specified in the filename parameter | `string` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | the amount of time that lambda allows a function to run before stopping it | `number` | `30` | no |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | the tracing mode for the lambda function - either 'Active' or 'PassThrough' | `string` | `"Active"` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | provide a list of security group ids and subnet ids to associate with the lambda function if it is to be deployed in a vpc | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_architectures"></a> [architectures](#output\_architectures) | the architectures supported by the lambda function |
| <a name="output_arn"></a> [arn](#output\_arn) | the arn of the lambda function |
| <a name="output_description"></a> [description](#output\_description) | the description of the lambda function |
| <a name="output_filename"></a> [filename](#output\_filename) | the filename of the lambda function |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | the name of the lambda function |
| <a name="output_handler"></a> [handler](#output\_handler) | the handler of the lambda function |
| <a name="output_id"></a> [id](#output\_id) | the id of the lambda function |
| <a name="output_image_uri"></a> [image\_uri](#output\_image\_uri) | the image uri of the lambda function |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | the invoke arn of the lambda function |
| <a name="output_last_modified"></a> [last\_modified](#output\_last\_modified) | the last modified date of the lambda function |
| <a name="output_logs_id"></a> [logs\_id](#output\_logs\_id) | the id of the cloudwatch log group |
| <a name="output_memory_size"></a> [memory\_size](#output\_memory\_size) | the memory size of the lambda function |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | the qualified arn of the lambda function |
| <a name="output_qualified_invoke_arn"></a> [qualified\_invoke\_arn](#output\_qualified\_invoke\_arn) | the qualified invoke arn of the lambda function |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | the arn of the role |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | the id of the role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | the name of the role |
| <a name="output_runtime"></a> [runtime](#output\_runtime) | the runtime of the lambda function |
| <a name="output_version"></a> [version](#output\_version) | the version of the lambda function |
<!-- END_TF_DOCS -->