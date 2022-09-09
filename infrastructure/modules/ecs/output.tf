output "task_definition" {
  value = aws_ecs_task_definition.weatherapp_ecstask.arn
}

output "container_name" {
  value = aws_ecs_task_definition.weatherapp_ecstask.family
}