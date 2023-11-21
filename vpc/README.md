# Terraform Module for VPC

## Introduction

Module responsible for creating a VPC Network.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 vpc_name = 

	 # Optional variables
	 auto_create_subnetworks = false
	 delete_default_routes_on_create = false
	 routing_mode = "REGIONAL"
}
```
## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | n/a | `bool` | `false` | no |
| <a name="input_delete_default_routes_on_create"></a> [delete\_default\_routes\_on\_create](#input\_delete\_default\_routes\_on\_create) | n/a | `bool` | `false` | no |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | n/a | `string` | `"REGIONAL"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The VPC name | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->