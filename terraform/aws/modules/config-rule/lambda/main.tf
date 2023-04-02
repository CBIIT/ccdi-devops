resource "aws_config_config_rule" "lambda_concurrency_check" {
  name = "lambda-concurrency-check"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_CONCURRENCY_CHECK"
  }
}

resource "aws_config_config_rule" "lambda_dlq_check" {
  name = "lambda-dlq-check"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_DLQ_CHECK"
  }
}

resource "aws_config_config_rule" "lambda_function_public_access_prohibited" {
  name = "lambda-function-public-access-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED"
  }
}

resource "aws_config_config_rule" "lambda_function_settings_check" {
  name = "lambda-function-settings-check"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_FUNCTION_SETTINGS_CHECK"
  }
}

resource "aws_config_config_rule" "lambda_inside_vpc" {
  name = "lambda-inside-vpc"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_INSIDE_VPC"
  }
}


resource "aws_config_config_rule" "lambda_vpc_multi_az_check" {
  name = "lambda-vpc-multi-az-check"

  source {
    owner             = "AWS"
    source_identifier = "LAMBDA_VPC_MULTI_AZ_CHECK"
  }
}
