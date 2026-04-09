output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "ecr_repository_name" {
  description = "ECR repository name"
  value       = module.ecr.repository_name
}

output "github_actions_role_arn" {
  description = "GitHub Actions IAM Role ARN"
  value       = module.iam.github_actions_role_arn
}

output "ecs_task_execution_role_arn" {
  description = "ECS Task Execution Role ARN"
  value       = module.iam.ecs_task_execution_role_arn
}

output "ecs_task_role_arn" {
  description = "ECS Task Role ARN"
  value       = module.iam.ecs_task_role_arn
}

output "alb_sg_id" {
  description = "ALB Security Group ID"
  value       = module.security_groups.alb_sg_id
}

output "ecs_sg_id" {
  description = "ECS Security Group ID"
  value       = module.security_groups.ecs_sg_id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "ALB ARN"
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "ALB Target Group ARN"
  value       = module.alb.target_group_arn
}

output "log_group_name" {
  description = "CloudWatch Log Group Name"
  value       = module.cloudwatch.log_group_name
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = module.ecs.ecs_cluster_name
}

output "ecs_cluster_arn" {
  description = "ECS Cluster ARN"
  value       = module.ecs.ecs_cluster_arn
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = module.ecs.ecs_task_definition_arn
}