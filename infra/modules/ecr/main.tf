locals {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_ecr_repository" "this" {
  name                 = "${local.name}-ecr"
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(var.tags, {
    Name = "${local.name}-ecr"
  })
}