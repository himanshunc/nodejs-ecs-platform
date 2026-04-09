locals {
  name = "${var.project_name}-${var.environment}"
}

resource "aws_ecs_cluster" "this" {
  name = "${local.name}-ecs-cluster"

  tags = merge(var.tags, {
    Name = "${local.name}-ecs-cluster"
  })
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${local.name}-ecs-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name      = "${local.name}-app"
      image     = var.image_uri
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = var.log_stream_prefix
        }
      }
    }
  ])

  tags = merge(var.tags, {
    Name = "${local.name}-ecs-task"
  })
}

resource "aws_ecs_service" "this" {
  name            = "${local.name}-ecs-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${local.name}-app"
    container_port   = var.container_port
  }

  depends_on = [aws_ecs_task_definition.this]

  tags = merge(var.tags, {
    Name = "${local.name}-ecs-service"
  })
}