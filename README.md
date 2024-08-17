<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.60 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.60 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | flagscript/flagscript-s3-bucket/aws | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state_lock_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_provisioned_read_capacity"></a> [provisioned\_read\_capacity](#input\_provisioned\_read\_capacity) | Read capacity when in provisioned mode. | `number` | `20` | no |
| <a name="input_provisioned_write_capacity"></a> [provisioned\_write\_capacity](#input\_provisioned\_write\_capacity) | Read capacity when in provisioned mode. | `number` | `20` | no |
| <a name="input_state_lock_table_name"></a> [state\_lock\_table\_name](#input\_state\_lock\_table\_name) | Name for the dynamo state table. | `string` | `"terraform-state-lock"` | no |
| <a name="input_use_pay_per_request"></a> [use\_pay\_per\_request](#input\_use\_pay\_per\_request) | Whether or not to use dynamo pay per request mode. Setting this to false will use provisioned billing mode. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_state_bucket_arn"></a> [state\_bucket\_arn](#output\_state\_bucket\_arn) | Arn of the terraform aws state bucket. |
| <a name="output_state_bucket_name"></a> [state\_bucket\_name](#output\_state\_bucket\_name) | Name of the terraform aws state bucket. |
| <a name="output_state_lock_table_arn"></a> [state\_lock\_table\_arn](#output\_state\_lock\_table\_arn) | Arn of the state lock table. |
| <a name="output_state_lock_table_name"></a> [state\_lock\_table\_name](#output\_state\_lock\_table\_name) | Name of the state lock table. |
<!-- END_TF_DOCS -->