variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "shared"
}

variable "tf_state_bucket_name" {
  description = "S3 bucket name for Terraform remote state"
  type        = string
}

variable "tf_lock_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
}