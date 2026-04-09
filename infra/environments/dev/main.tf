locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "iam" {
  source = "../../modules/iam"

  project_name             = var.project_name
  environment              = var.environment
  github_org               = var.github_org
  github_repo              = var.github_repo
  github_actions_role_name = "${var.project_name}-${var.environment}-github-actions-role"

  tags = local.common_tags
}

module "ecr" {
  source = "../../modules/ecr"

  project_name         = var.project_name
  environment          = var.environment
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true

  tags = local.common_tags
}

module "vpc" {
  source = "../../modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  tags = local.common_tags
}

module "security_groups" {
  source = "../../modules/security_groups"

  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port

  tags = local.common_tags
}

module "alb" {
  source = "../../modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security_groups.alb_sg_id
  container_port    = var.container_port
  health_check_path = var.health_check_path

  tags = local.common_tags
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"

  project_name      = var.project_name
  environment       = var.environment
  retention_in_days = 14

  tags = local.common_tags
}

module "ecs" {
  source = "../../modules/ecs"

  project_name                = var.project_name
  environment                 = var.environment
  image_uri                   = var.image_uri
  container_port              = var.container_port
  task_cpu                    = var.task_cpu
  task_memory                 = var.task_memory
  desired_count               = var.desired_count
  private_subnet_ids          = module.vpc.private_subnet_ids
  ecs_sg_id                   = module.security_groups.ecs_sg_id
  target_group_arn            = module.alb.target_group_arn
  log_group_name              = module.cloudwatch.log_group_name
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.iam.ecs_task_role_arn
  aws_region                  = var.aws_region

  tags = local.common_tags
}