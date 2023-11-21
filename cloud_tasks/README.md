# Terraform Module for Cloud Tasks

## Introduction

Module responsible for creating a Cloud Tasks.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 location = 
	 name = 
}
```
## Resources

| Name | Type |
|------|------|
| [google_cloud_tasks_queue.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_tasks_queue) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_task_id"></a> [cloud\_task\_id](#output\_cloud\_task\_id) | Cloud Task ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->