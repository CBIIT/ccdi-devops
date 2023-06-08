![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage

<pre><code>
module "securityhub" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/security-hub?ref=v?.?.?"

  manager_account_id          = 
  enable_cis_standard         = 
  enable_foundations_standard = 
  enable_nist_standard        =
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
| [aws_securityhub_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_account) | resource |
| [aws_securityhub_invite_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_invite_accepter) | resource |
| [aws_securityhub_standards_subscription.cis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.foundations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.nist](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_cis_standard"></a> [enable\_cis\_standard](#input\_enable\_cis\_standard) | enable the cis aws foundations benchmark standard in security hub | `bool` | `false` | no |
| <a name="input_enable_foundations_standard"></a> [enable\_foundations\_standard](#input\_enable\_foundations\_standard) | enable the aws foundational security best practices standard in security hub | `bool` | `false` | no |
| <a name="input_enable_nist_standard"></a> [enable\_nist\_standard](#input\_enable\_nist\_standard) | enable the nist 800-53 standard in security hub | `bool` | `true` | no |
| <a name="input_manager_account_id"></a> [manager\_account\_id](#input\_manager\_account\_id) | the aws account id of the fnl manager account | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the implementation of security hub |
| <a name="output_id"></a> [id](#output\_id) | id of the account where security hub was implemented |
<!-- END_TF_DOCS -->