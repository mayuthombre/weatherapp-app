locals {
  name        = "mayu-weatherapp-ecs"
  region      = "us-east-1"

  tags = {
    owner       = "mayu"
    build       = "weatherapp"
    iac         = "terraform"
    program     = "dojo"
    environment = "dev"
  }
}