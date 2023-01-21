<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_lb.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | The log bucket to send S3 access logs to | `string` | n/a | yes |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | set to true to enable alb access logs | `bool` | n/a | yes |
| <a name="input_alb_listener_ssl_policy"></a> [alb\_listener\_ssl\_policy](#input\_alb\_listener\_ssl\_policy) | The ssl policy to associate with the HTTPS listener for the ALB | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | The name of the application (i.e. 'mtp') | `string` | n/a | yes |
| <a name="input_domain_certificate_arn"></a> [domain\_certificate\_arn](#input\_domain\_certificate\_arn) | The ARN of the certificate manager domain certificate for the ALB | `string` | n/a | yes |
| <a name="input_internal"></a> [internal](#input\_internal) | Set to true for non-prod accounts that do have allowable internet egress | `bool` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | The name of the program (i.e. 'ccdi') | `string` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | The subnets associated with the load balancer | `set(string)` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The ID of the security group associated with the load balancer | `set(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier or environment (i.e. 'dev') - use 'terraform.workspace' for this variable | `string` | n/a | yes |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | Indecates whether or not headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false) | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool` | `true` | no |
| <a name="input_fixed_response_content_type"></a> [fixed\_response\_content\_type](#input\_fixed\_response\_content\_type) | The fixed response HTTPS content type | `string` | `"text/plain"` | no |
| <a name="input_fixed_response_message_body"></a> [fixed\_response\_message\_body](#input\_fixed\_response\_message\_body) | The default message body when an ALB is not allowing traffic from a fixed response action | `string` | `"The application is not available at this time. Please try again soon."` | no |
| <a name="input_fixed_response_status_code"></a> [fixed\_response\_status\_code](#input\_fixed\_response\_status\_code) | The fixed response status code | `string` | `"200"` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | The standard HTTP port | `number` | `80` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | The standard HTTP protocol | `string` | `"HTTP"` | no |
| <a name="input_http_redirect_status_code"></a> [http\_redirect\_status\_code](#input\_http\_redirect\_status\_code) | The HTTP redirect to HTTPS default status code | `string` | `"HTTP_301"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | The standard HTTPS port | `number` | `443` | no |
| <a name="input_https_protocol"></a> [https\_protocol](#input\_https\_protocol) | The standard HTTPS protocol | `string` | `"HTTPS"` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | The type of load balancer to create. Possible values are application, gateway, or network. The default value is application | `string` | `"application"` | no |
| <a name="input_timeout_create"></a> [timeout\_create](#input\_timeout\_create) | The time allowed for timeout when creating the ALB resource. | `string` | `"10m"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | n/a |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | The HTTP listener ARN |
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->