resource "aws_neptune_parameter_group" "this" {
  name        = "${local.stack}-neptune-instance-params"
  family      = var.family
  description = "${local.stack} neptune instance-level parameter group"

  parameter {
    name  = "neptune_query_timeout"
    value = var.query_timeout
  }

  parameter {
    name  = "neptune_result_cache"
    value = var.enable_caching ? "1" : "0"
  }
}
