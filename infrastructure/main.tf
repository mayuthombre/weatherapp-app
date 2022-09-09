module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket

  tags = var.tags
}

#calling ecs module from weatherapp-infra repo
module "ecr" {
  source = "git::https://github.com/mayuthombre/weatherapp-infra.git//infrastructure/modules/ecr?ref=master"
}

#calling iam module from weatherapp-infra repo
module "iam" {
  source = "git::https://github.com/mayuthombre/weatherapp-infra.git//infrastructure/modules/iam?ref=master"
}

module "ecs" {
  source = "./modules/ecs"

  repo_url = module.ecr.repo_url
  ecsTaskExecutionRole = module.iam.ecsTaskExecutionRole
  depends_on = [
    module.ecr,
    module.iam
  ]
}