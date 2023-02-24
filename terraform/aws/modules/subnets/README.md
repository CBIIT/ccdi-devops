<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_subnet.database_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.database_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.webapp_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.webapp_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.webapp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_1_id"></a> [database\_1\_id](#output\_database\_1\_id) | the id of the first subnet in the set of database subnets |
| <a name="output_database_2_id"></a> [database\_2\_id](#output\_database\_2\_id) | the id of the second subnet in the set of database subnets |
| <a name="output_database_all_ids"></a> [database\_all\_ids](#output\_database\_all\_ids) | the ids of both database subnets in the vpc |
| <a name="output_public_1_id"></a> [public\_1\_id](#output\_public\_1\_id) | the id of the first subnet in the set of public subnets |
| <a name="output_public_2_id"></a> [public\_2\_id](#output\_public\_2\_id) | the id of the second subnet in the set of public subnets |
| <a name="output_public_all_ids"></a> [public\_all\_ids](#output\_public\_all\_ids) | the ids of both public subnets in the vpc |
| <a name="output_webapp_1_id"></a> [webapp\_1\_id](#output\_webapp\_1\_id) | the id of the first subnet in the set of webapp subnets |
| <a name="output_webapp_2_id"></a> [webapp\_2\_id](#output\_webapp\_2\_id) | the id of the second subnet in the set of webapp subnets |
| <a name="output_webapp_all_ids"></a> [webapp\_all\_ids](#output\_webapp\_all\_ids) | the ids of both webapp subnets in the vpc |
<!-- END_TF_DOCS -->