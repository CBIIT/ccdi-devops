![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage

<pre><code>
module "this" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/secrets-manager?ref=v3.0.1"

  app                               = 
  description                       = 
  enable_secret_policy              = 
  enable_secret_rotation            = 
  env                               =
  program                           =
  recovery_window_in_days           =
  rotation_automatically_after_days = 
  rotation_lambda_arn               =
  secret_policy                     = 
  secret_string                     =
  secret_suffix                     = 
}
</code></pre>

<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_policy) | resource |
| [aws_secretsmanager_secret_rotation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_rotation) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | description of the secret | `string` | n/a | yes |
| <a name="input_enable_secret_policy"></a> [enable\_secret\_policy](#input\_enable\_secret\_policy) | whether to provide and attach a secret access policy | `bool` | `false` | no |
| <a name="input_enable_secret_rotation"></a> [enable\_secret\_rotation](#input\_enable\_secret\_rotation) | whether to enable automated secret rotation | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_recovery_window_in_days"></a> [recovery\_window\_in\_days](#input\_recovery\_window\_in\_days) | days to wait before deleting the secret - can be 0, or between 7 and 30 | `number` | `0` | no |
| <a name="input_rotation_automatically_after_days"></a> [rotation\_automatically\_after\_days](#input\_rotation\_automatically\_after\_days) | number of days to wait before invoking automated rotation facilitated by lambda | `number` | `null` | no |
| <a name="input_rotation_lambda_arn"></a> [rotation\_lambda\_arn](#input\_rotation\_lambda\_arn) | arn of the lambda function that can rotate the secret | `string` | `null` | no |
| <a name="input_secret_policy"></a> [secret\_policy](#input\_secret\_policy) | provide an optional access policy for the secret | `string` | `null` | no |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | provide the map of key value pairs as the secret value - the module encodes the argument as json | `map(any)` | n/a | yes |
| <a name="input_secret_suffix"></a> [secret\_suffix](#input\_secret\_suffix) | provide a suffix to append to the secret name after the stack name | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the secret |
| <a name="output_id"></a> [id](#output\_id) | id of the secret |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | id of the kms key used to encrypt the secret (if specified) |
| <a name="output_name"></a> [name](#output\_name) | name of the secret |
| <a name="output_version_arn"></a> [version\_arn](#output\_version\_arn) | arn of the secret version |
| <a name="output_version_id"></a> [version\_id](#output\_version\_id) | id of the secret version |
| <a name="output_version_secret_string"></a> [version\_secret\_string](#output\_version\_secret\_string) | secret key-value pairs |
| <a name="output_version_version_id"></a> [version\_version\_id](#output\_version\_version\_id) | version id of the secret version |
<!-- END_TF_DOCS -->