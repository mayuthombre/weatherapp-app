variable "bucket" {
  type        = string
  description = "Specifies the name of an S3 Bucket"
  default     = "mayu-pathway-dojo-weatherapp-app-s3"
}

variable "tags" {
  type        = map(string)
  description = "Use tags to identify project resources"
  default     = {}
}
