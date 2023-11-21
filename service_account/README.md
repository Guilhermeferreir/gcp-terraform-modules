# Terraform Module for Service Account

## Introduction

Module responsible for creating a Service Account.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 account_id = 
	 display_name = 
	 project_id = 

	 # Optional variables
	 roles = []
}
```
## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.service_account_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | `set(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | Service Account ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->