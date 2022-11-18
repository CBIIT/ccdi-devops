resource "aws_ecs_cluster" "cluster" {
  # checkov:skip=CKV_AWS_65: Container insights are enabled by default
  name = "${var.program}-${var.tier}-${var.app}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = var.container_insights_enabled
  }
}

