<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_opensearch_domain_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_opensearch_domain_arn"></a> [opensearch\_domain\_arn](#input\_opensearch\_domain\_arn) | The ARN of the OpenSearch domain | `string` | n/a | yes |
| <a name="input_opensearch_domain_name"></a> [opensearch\_domain\_name](#input\_opensearch\_domain\_name) | The name of the OpenSearch domain | `string` | n/a | yes |
<!-- END_TF_DOCS -->