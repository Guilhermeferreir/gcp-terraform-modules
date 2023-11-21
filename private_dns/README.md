# Terraform Module for Private DNS

## Introduction

Module responsible for creating a Private DNS.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 description = 
	 dns_name = 
	 name = 
	 network = 

	 # Optional variables
	 labels = {}
	 records = {}
	 visibility = "private"
}
```
## Resources

| Name | Type |
|------|------|
| [google_dns_managed_zone.private_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |
| [google_dns_record_set.records](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the zone | `string` | n/a | yes |
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | The DNS name | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The zone name | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network name | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | n/a | `map(any)` | `{}` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the zone | `string` | `"private"` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->