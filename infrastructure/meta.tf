terraform {
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket = "pathways-dojo"
    key    = "mayu-tfstate-support"
    region = "us-east-1"
  }
}


# terraform {
#   backend "local" {
#     path = "./terraform/terraform.tfstate"
#   }
# }