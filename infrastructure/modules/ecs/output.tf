# task definition will be used by ecs service in different infra github repo
output "task_definition" {
  value = aws_ecs_task_definition.weatherapp_ecstask.arn
}

# container name will be used by ecs service in different infra github repo
output "container_name" {
  value = aws_ecs_task_definition.weatherapp_ecstask.family
}