variable "name" {
  type    = string
  default = "mayu-weatherapp"
}

variable "blue_cluster_arn" {
  type    = string
  default = " arn:aws:ecs:ap-southeast-2:152848913167:cluster/mayu-weatherapp-cluster"
}

variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "tags" {
  type = map(any)
  default = {
    owner       = "mayu"
    build       = "weatherapp"
    iac         = "terraform"
    program     = "dojo"
    environment = "dev"
  }
}