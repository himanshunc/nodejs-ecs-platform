variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {}
}