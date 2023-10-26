resource "aws_neptune_cluster_parameter_group" "this" {
  name        = "${local.stack}-neptune-cluster-params"
  family      = var.family
  description = "${local.stack} neptune cluster-level parameter group"

  parameter {
    name  = "neptune_enable_audit_log"
    value = var.enable_audit_log ? "1" : "0"
  }
}
