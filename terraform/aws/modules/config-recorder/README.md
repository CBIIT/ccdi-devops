![Frederick National Laboratory](./assets/fnl.svg)

# Overview

A module that creates an AWS Config Recorder resource, an AWS Config Delivery Channel resource, and an IAM Role that is assumed by the AWS Config service. The Config Recorder resource defines the scope of services that the Config service can monitor. The default value (expressed as a list) for the variable `recording_group_resource_types` defines the scope for all services that we want to monitor, and ommits resources that are either (a) not relevant; or (b) not managed by FNL/CTOS and do not relate to services managed by FNL/CTOS.

# Usage

As a best practice, consider using the values of `nonprod` or `prod` for the argument passed to the module called `env`, rather than providing the `terraform.workspace`. See examples for more information.

## Module Template

The following provides an example of how to use this module by defining values for all required and optional variables. Remember to pin the release version using the `?ref` reference trailing the url in the `source` argument.

<pre><code>module "config_recorder" {
    source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/config-recorder?ref=v?.?.?"

    app                             =
    attach_permissions_boundary     =
    config_s3_bucket_name           =
    enable_config                   =
    env                             =
    manager_account_id              =
    program                         =
    recording_group_resource_types  =
}</code></pre>

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
| <a name="module_role"></a> [role](#module\_role) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/config-recorder | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_config_aggregate_authorization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_aggregate_authorization) | resource |
| [aws_config_configuration_recorder.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder) | resource |
| [aws_config_configuration_recorder_status.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_configuration_recorder_status) | resource |
| [aws_config_delivery_channel.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/config_delivery_channel) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether or not to attach a permissions boundary to the role created for the config service | `bool` | n/a | yes |
| <a name="input_enable_config"></a> [enable\_config](#input\_enable\_config) | whether to enable aws config | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_manager_account_id"></a> [manager\_account\_id](#input\_manager\_account\_id) | the manager account id to authorize aggregation | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the aws config configuration recorder |
| <a name="output_name"></a> [name](#output\_name) | name of the aws config configuration recorder |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | arn of the aws config configuration recorder role |
<!-- END_TF_DOCS -->
