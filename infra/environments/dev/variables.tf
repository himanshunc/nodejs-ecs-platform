variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "image_uri" {
  description = "Container image URI"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "desired_count" {
  description = "Desired ECS task count"
  type        = number
  default     = 1
}

variable "task_cpu" {
  description = "Fargate task CPU"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Fargate task memory"
  type        = string
  default     = "512"
}

variable "health_check_path" {
  description = "ALB health check path"
  type        = string
  default     = "/health"
}