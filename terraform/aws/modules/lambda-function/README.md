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

# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | the architectures supported by the lambda function | `string` | `"x86_64"` | no |
| <a name="input_attach_permission_boundary"></a> [attach\_permission\_boundary](#input\_attach\_permission\_boundary) | whether to attach a permission boundary to the iam role for lambda | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | describe the purpose of the lambda function | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | provide a map of key-value pairs to be used as environment variables for the lambda function | `map(string)` | `{}` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | provide the path and name of the file that contains your lambda function code | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | provide a name for the lambda function that will be appended to the stack name | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | the name of the handler function (for example, main.lambda\_handler) | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | the amount of memory available to the lambda function | `number` | `128` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | provide the role that provides permission for the lambda function to access aws services and resources | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | the language-specific environment specified in the runtime parameter | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | optionally provide a list of security group ids to associate with the lambda function | `list(string)` | `[]` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | the base64-encoded sha256 hash of the package file specified in the filename parameter | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | optionally provide a list of subnet ids to associate with the lambda function | `list(string)` | `[]` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | the amount of time that lambda allows a function to run before stopping it | `number` | `30` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | the arn of the lambda function |
| <a name="output_description"></a> [description](#output\_description) | the description of the lambda function |
| <a name="output_filename"></a> [filename](#output\_filename) | the filename of the lambda function |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | the name of the lambda function |
| <a name="output_handler"></a> [handler](#output\_handler) | the handler of the lambda function |
| <a name="output_id"></a> [id](#output\_id) | the id of the lambda function |
| <a name="output_image_uri"></a> [image\_uri](#output\_image\_uri) | the image uri of the lambda function |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | the invoke arn of the lambda function |
| <a name="output_last_modified"></a> [last\_modified](#output\_last\_modified) | the last modified date of the lambda function |
| <a name="output_memory_size"></a> [memory\_size](#output\_memory\_size) | the memory size of the lambda function |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | the qualified arn of the lambda function |
| <a name="output_qualified_invoke_arn"></a> [qualified\_invoke\_arn](#output\_qualified\_invoke\_arn) | the qualified invoke arn of the lambda function |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | the arn of the role |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | the id of the role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | the name of the role |
| <a name="output_version"></a> [version](#output\_version) | the version of the lambda function |
<!-- END_TF_DOCS -->