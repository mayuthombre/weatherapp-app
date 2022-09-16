variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "name for each resource"
  default     = ""
}

variable "region" {
  type        = string
  description = "Region in which AWS resources will be created"
  default     = ""
}