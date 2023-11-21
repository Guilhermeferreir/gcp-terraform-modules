# Terraform Module for Service Account Key

## Introduction

Module responsible for creating a Service Account Key.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 service_account_id = 
}
```
## Resources

| Name | Type |
|------|------|
| [google_service_account_key.service_account_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | n/a | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_key_id"></a> [service\_account\_key\_id](#output\_service\_account\_key\_id) | Service Account Key ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->