resource "aws_ecs_cluster" "this" {
  name = "${local.stack}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = var.container_insights_enabled ? "enabled" : "disabled"
  }
}
