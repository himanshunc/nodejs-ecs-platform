locals {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${local.name}-app"
  retention_in_days = var.retention_in_days

  tags = merge(var.tags, {
    Name = "${local.name}-log-group"
  })
}