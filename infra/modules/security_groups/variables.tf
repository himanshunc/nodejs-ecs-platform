variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "container_port" {
  description = "Application container port"
  type        = number
}

variable "alb_ingress_port" {
  description = "Port to allow inbound traffic to ALB"
  type        = number
  default     = 80
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to access ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {}
}