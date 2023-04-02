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
| [aws_config_config_rule.aurora_last_backup_recovery_point_created](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.aurora_mysql_backtracking_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |
| [aws_config_config_rule.aurora_resources_protected_by_backup_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_config_rule) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_periodic_rules"></a> [enable\_periodic\_rules](#input\_enable\_periodic\_rules) | whether to enable rules that are evaluated periodically, not on changes - may increase costs | `bool` | `false` | no |
<!-- END_TF_DOCS -->