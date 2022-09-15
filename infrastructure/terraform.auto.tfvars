# standardised tags that will be used across all the resources that support tagging
tags = {
  owner       = "mayu"
  build       = "weatherapp"
  iac         = "terraform"
  program     = "dojo"
  environment = "dev"
}

# stanadrd prefix for resources names
name = "mayu-weatherapp"

# CPU memory and units required for each tasks
variable "cpu" {
  type = number
  description = "CPU units for each task"
  default = 256
}

variable "memory" {
  type = number
  description = "memory for tasks"
  default = 512
}