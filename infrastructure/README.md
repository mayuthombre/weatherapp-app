## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | git::https://github.com/mayuthombre/weatherapp-infra.git//infrastructure/modules/ecr | master |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./modules/ecs | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | git::https://github.com/mayuthombre/weatherapp-infra.git//infrastructure/modules/iam | master |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | name for each resource | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Use tags to identify project resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
