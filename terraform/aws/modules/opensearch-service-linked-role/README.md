![Frederick National Laboratory](./assets/fnl.svg)

# Overview

# Usage

<pre><code>
placeholder
</code></pre>

<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_iam_policy.service-linked-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.service_linked_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.service_linked_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether or not to attach a permissions boundary to the role | `bool` | `false` | no |
| <a name="input_create_manual_snapshot_role"></a> [create\_manual\_snapshot\_role](#input\_create\_manual\_snapshot\_role) | whether to create a role to enable manual snapshot operations | `bool` | `false` | no |
| <a name="input_domain_name_suffix"></a> [domain\_name\_suffix](#input\_domain\_name\_suffix) | the domain name suffix that follows the stack name for the opensearch cluster this role is associated with | `string` | `"opensearch"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_snapshot_bucket_arn"></a> [snapshot\_bucket\_arn](#input\_snapshot\_bucket\_arn) | arn of the bucket to store snapshots - required when create\_manual\_snapshot\_role is true | `string` | `"null"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the opensearch role |
| <a name="output_id"></a> [id](#output\_id) | id of the opensearch role |
| <a name="output_name"></a> [name](#output\_name) | name of the opensearch role |
<!-- END_TF_DOCS -->