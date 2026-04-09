output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.this.name
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.this.name
}

output "ecs_task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = aws_ecs_task_definition.this.arn
}

output "ecs_cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.this.arn
}