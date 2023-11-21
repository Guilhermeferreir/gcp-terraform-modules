# Terraform Module for Secret Version

## Introduction

Module responsible for creating a Secret Version.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 secret = 
	 secret_data = 
}
```
## Resources

| Name | Type |
|------|------|
| [google_secret_manager_secret_version.version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret"></a> [secret](#input\_secret) | n/a | `string` | n/a | yes |
| <a name="input_secret_data"></a> [secret\_data](#input\_secret\_data) | n/a | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_version_id"></a> [secret\_version\_id](#output\_secret\_version\_id) | Secret Version ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->