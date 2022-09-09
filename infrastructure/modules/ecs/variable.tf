variable "repo_url" {
  type        = string
  description = "ecr repl url exported from infra's github repo"
  default     = {}
}

variable "ecsTaskExecutionRole" {
  type        = string
  description = "IAM role ID exported from infra's github repo"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name for each resource"
  default     = {}
}