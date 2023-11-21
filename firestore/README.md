# Terraform Module for Firestore

## Introduction

Module responsible for Firestore setup.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 app_engine_integration_mode = 
	 concurrency_mode = 
	 location_id = 
	 name = 
	 project_id = 
	 type = 
}
```
## Resources

| Name | Type |
|------|------|
| [google_firestore_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_database) | resource |
| [google_project_service.firestore](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [null_resource.previous](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [time_sleep.wait_60_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_engine_integration_mode"></a> [app\_engine\_integration\_mode](#input\_app\_engine\_integration\_mode) | n/a | `string` | n/a | yes |
| <a name="input_concurrency_mode"></a> [concurrency\_mode](#input\_concurrency\_mode) | n/a | `string` | n/a | yes |
| <a name="input_location_id"></a> [location\_id](#input\_location\_id) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->