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
| [aws_config_config_rule.cloud_trail_cloud_watch_logs_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud_trail_encryption_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloud_trail_log_file_validation_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudtrail_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudtrail_s3_dataevents_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.cloudtrail_security_trail_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_periodic_rules"></a> [enable\_periodic\_rules](#input\_enable\_periodic\_rules) | whether to enable rules that are evaluated periodically, not on changes - may increase costs | `bool` | `false` | no |
<!-- END_TF_DOCS -->