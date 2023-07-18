resource "aws_api_gateway_rest_api" "this" {
  api_key_source               = var.api_key_source                 #  x-amazon-apigateway-api-key-source extension
  binary_media_types           = var.binary_media_types             # x-amazon-apigateway-binary-media-types extension.
  body                         = var.body                           # json or yaml encoded specification file
  description                  = var.description                    # native info.description field
  disable_execute_api_endpoint = var.disable_execute_api_endpoint   # x-amazon-apigateway-endpoint-configuration extension,  disableExecuteApiEndpoint property 
  fail_on_warnings             = var.fail_on_warnings               # whether warnings while API Gateway is creating or updating the resource should return an error or not. Defaults to false
  minimum_compression_size     = var.minimum_compression_size       #  x-amazon-apigateway-minimum-compression-size
  name                         = "${local.stack}-${var.api_suffix}" # info.title field
  put_rest_api_mode            = var.put_rest_api_mode              #  x-amazon-apigateway-put-integration-method extension

  endpoint_configuration {
    types = var.endpoint_configuration_types
  }

  parameters = var.parameters
}
