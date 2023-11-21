# Terraform Module for Cloud NAT

## Introduction

Module responsible for creating a Cloud NAT.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 cloud_nat_name = 
	 cloud_router_name = 
	 network = 
	 region = 
	 subnetwork = 

	 # Optional variables
	 nat_ip_allocate_option = "AUTO_ONLY"
	 source_ip_ranges_to_nat = [
  "ALL_IP_RANGES"
]
	 source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
}
```
## Resources

| Name | Type |
|------|------|
| [google_compute_router.cloud_nat_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.cloud_nat_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_nat_name"></a> [cloud\_nat\_name](#input\_cloud\_nat\_name) | The Cloud NAT name | `string` | n/a | yes |
| <a name="input_cloud_router_name"></a> [cloud\_router\_name](#input\_cloud\_router\_name) | The Cloud Router name | `string` | n/a | yes |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | n/a | `string` | `"AUTO_ONLY"` | no |
| <a name="input_network"></a> [network](#input\_network) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_source_ip_ranges_to_nat"></a> [source\_ip\_ranges\_to\_nat](#input\_source\_ip\_ranges\_to\_nat) | n/a | `set(string)` | <pre>[<br>  "ALL_IP_RANGES"<br>]</pre> | no |
| <a name="input_source_subnetwork_ip_ranges_to_nat"></a> [source\_subnetwork\_ip\_ranges\_to\_nat](#input\_source\_subnetwork\_ip\_ranges\_to\_nat) | n/a | `string` | `"LIST_OF_SUBNETWORKS"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | n/a | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_nat_id"></a> [cloud\_nat\_id](#output\_cloud\_nat\_id) | Cloud NAT ID |
| <a name="output_cloud_router_id"></a> [cloud\_router\_id](#output\_cloud\_router\_id) | Cloud Router ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->