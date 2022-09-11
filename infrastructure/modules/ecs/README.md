## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_task_definition.weatherapp_ecstask](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecsTaskExecutionRole"></a> [ecsTaskExecutionRole](#input\_ecsTaskExecutionRole) | IAM role ID exported from infra's github repo | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name for each resource | `string` | `""` | no |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | ecr repl url exported from infra's github repo | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | container name will be used by ecs service in different infra github repo |
| <a name="output_task_definition"></a> [task\_definition](#output\_task\_definition) | task definition will be used by ecs service in different infra github repo |
