output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb.id
}

output "ecs_sg_id" {
  description = "Security Group ID for ECS Service"
  value       = aws_security_group.ecs.id
}