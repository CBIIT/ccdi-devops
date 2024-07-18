![Frederick National Laboratory](./assets/fnl.svg)

# Overview

A module that creates an AWS Application Load Balancer (ALB) based on standards and conventions established by the program. Load Balancer Listener Rules and Target Groups are not created by this module. The ALB automatically sends server-side access logs to the central management account, simplifying implementation while conforming to observability best practices.

# Usage 

The following provides an example of how to use this module by defining values for all required and optional variables. Remember to pin the release version using the `?ref` reference trailing the url in the `source` argument.

## Module Template
The following code block is provided for engineers to copy into project repositories that intend to call this module. Keep in mind that all arguments are declared in the code block. Depending on intended use, some arguments may not be necessary to define at the project level. See the Conditional Resources section for more details. 

<pre><code> module "alb" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/alb?ref=v?.?.?"

  app                         = 
  certificate_arn             = 
  create_http_listener        = 
  create_https_listener       = 
  create_security_group       = 
  env                         = 
  http_port                   =  
  http_protocol               = 
  https_port                  = 
  https_protocol              = 
  internal                    = 
  desync_mitigation_mode      = 
  drop_invalid_header_fields  = 
  enable_deletion_protection  = 
  enable_http2                = 
  enable_waf_fail_open        = 
  idle_timeout                = 
  preserve_host_header        = 
  program                     = 
  security_group_ids          = 
  security_group_ingress_cidr = 
  ssl_policy                  = 
  subnets                     = 
  vpc_id                      = 
}</code></pre>

## Conditional Resources

Based on intended usage of this module, some resources and configurations are conditionally set to offer maximum flexibility and support a broader range of use cases. 

### Application Load Balancer HTTP Listener Resource
The variable named `create_http_listener` allows engineers to specify whether the module should produce an HTTP Listener. If created, the Listener is automatically associated with the Application Load Balancer, and is configured with a default rule that redirects HTTP traffic to the HTTPS Listener associated with the Load Balancer. Engineers are advised to provide a value of `true` for this argument unless project-level requirements specify a different default rule. 

### Application Load Balancer HTTPS Listener Resource
The variable named `create_https_listener` allows engineers to specify whether the module should produce an HTTP Listener. If created, the Listener is automatically associated with the Application Load Balancer, and is configured with a default rule that establishes a fixed response and error code if the inbound traffic does not align with any of the listener rules defined at the project level. There are two circumstances where an engineer may not want the Listener rule to be created:
- A valid SSL certificate is not available in the account to associate with the HTTPS Listener
- A deployment is executed in an environment that is not intended to be live at time of the deployment

### Security Group Resource
The variable named `create_security_group` allows engineers to specify whether the module should produce an AWS Security Group. If created, the security group is automatically associated with the Application Load Balancer, and is accompanied by a Security Group Rule that allows inbound traffic over any protocol to the Load Balancer from the CIDR range specified in the `security_group_ingress_cidr` variable. If `create_security_group` is set to true, engineers do not need to provide a value for the `security_group_ids` variable, but are required to set a value for `security_group_ingress_cidr`. Otherwise, engineers must create a Security Group at the project-level and provide the ID of that security group to the `security_group_ids` argument. 

Please note that NCI restricts traffic to the non-production account environments to only permit origins from within the NIH network. Even though the default rule allows traffic from any IP over any protocol, only requests originating from the NIH network will be able to reach the non-production load balancers.

<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.inbound_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.inbound_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | arn of the certificate for HTTPS listeners, not needed for HTTP listeners | `string` | `null` | no |
| <a name="input_create_http_listener"></a> [create\_http\_listener](#input\_create\_http\_listener) | whether to create an HTTP listener | `bool` | `true` | no |
| <a name="input_create_https_listener"></a> [create\_https\_listener](#input\_create\_https\_listener) | whether to create an HTTPS listener | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | whether to create a security group with default security group rules | `bool` | `true` | no |
| <a name="input_desync_mitigation_mode"></a> [desync\_mitigation\_mode](#input\_desync\_mitigation\_mode) | how the load balancer handles requests that might pose a security risk to an application due to HTTP desync, either monitor, defensive, or strictest | `string` | `"strictest"` | no |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | whether HTTP headers with header fields that are not valid are removed by the load balancer | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | prevents terraform from accidentally destroying the load balancer | `bool` | `true` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | whether HTTP/2 is enabled in application load balancers | `bool` | `true` | no |
| <a name="input_enable_waf_fail_open"></a> [enable\_waf\_fail\_open](#input\_enable\_waf\_fail\_open) | whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the requests to waf | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | port on which the load balancer is listening for HTTP requests | `number` | `80` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | protocol on which the load balancer is listening for HTTP requests | `string` | `"HTTP"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | port on which the load balancer is listening for HTTPS requests | `number` | `443` | no |
| <a name="input_https_protocol"></a> [https\_protocol](#input\_https\_protocol) | protocol on which the load balancer is listening for HTTPS requests | `string` | `"HTTPS"` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | in seconds, the amount of time the connection is permitted to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | whether the load balancer is internally facing | `bool` | `false` | no |
| <a name="input_preserve_host_header"></a> [preserve\_host\_header](#input\_preserve\_host\_header) | whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change | `bool` | `true` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | security group(s) to associate with the load balancer - required if create\_security\_group is false | `list(string)` | `[]` | no |
| <a name="input_security_group_ingress_cidr"></a> [security\_group\_ingress\_cidr](#input\_security\_group\_ingress\_cidr) | CIDR block to be configured for the ALB inbound | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | the name of the SSL policy for the HTTPS listener | `string` | `"ELBSecurityPolicy-TLS13-1-2-2021-06"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | the subnets to associate with the load balancer | `set(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of the vpc for the alb | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the load balancer |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | arn suffix of the load balancer |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | dns name of the load balancer |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | arn of the http listener |
| <a name="output_http_listener_id"></a> [http\_listener\_id](#output\_http\_listener\_id) | id of the http listener |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | arn of the https listener |
| <a name="output_https_listener_id"></a> [https\_listener\_id](#output\_https\_listener\_id) | id of the https listener |
| <a name="output_id"></a> [id](#output\_id) | id of the load balancer |
| <a name="output_name"></a> [name](#output\_name) | name of the load balancer |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | arn of the security group if created by this module |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | id of the security group if created by this module |
<!-- END_TF_DOCS -->