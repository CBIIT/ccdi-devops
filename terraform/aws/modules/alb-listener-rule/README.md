![Frederick National Laboratory](./assets/fnl.svg)

# Overview

# Usage

<pre><code>
module "load_balancer_listener_rule" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/alb-listener-rule?ref=v?.?.?"

  condition_host_header  = []
  condition_path_pattern = []
  listener_arn           = 
  priority               = 
  target_group_arn       = 
}
</code></pre>

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
| [aws_lb_listener_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_condition_host_header"></a> [condition\_host\_header](#input\_condition\_host\_header) | contains a single value item which is a list of host header patterns to match | `list(string)` | `[]` | no |
| <a name="input_condition_path_pattern"></a> [condition\_path\_pattern](#input\_condition\_path\_pattern) | Contains a single value item which is a list of path patterns to match against the request URL | `list(string)` | `[]` | no |
| <a name="input_listener_arn"></a> [listener\_arn](#input\_listener\_arn) | arn of the load balancer listener to forward traffic from | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | priority for the rule between 1 and 50000 - higher value means higher priority | `number` | n/a | yes |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | arn of the target group to forward traffic to | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the listener rule |
| <a name="output_id"></a> [id](#output\_id) | id of the listener rule |
<!-- END_TF_DOCS -->