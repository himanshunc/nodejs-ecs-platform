variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "image_uri" {
  description = "Container image URI from ECR"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "task_cpu" {
  description = "CPU for ECS task"
  type        = string
}

variable "task_memory" {
  description = "Memory for ECS task"
  type        = string
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS service"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security Group ID for ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "IAM role ARN for ECS task"
  type        = string
}

variable "aws_region" {
  description = "AWS region for logs"
  type        = string
}

variable "log_stream_prefix" {
  description = "CloudWatch log stream prefix"
  type        = string
  default     = "ecs"
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {}
}