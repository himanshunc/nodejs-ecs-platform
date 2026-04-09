aws_region   = "ap-south-1"
project_name = "nodejs"
environment  = "dev"

github_org  = "himanshunc"
github_repo = "nodejs-ecs-app"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

image_uri = "500849274222.dkr.ecr.ap-south-1.amazonaws.com/nodejs-dev-ecr:latest"

container_port    = 3000
desired_count     = 1
task_cpu          = "256"
task_memory       = "512"
health_check_path = "/health"