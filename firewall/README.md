# Terraform Module for Firewall

## Introduction

Module responsible for creating a Firewall Rule.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 firewall_name = 
	 network = 
	 ports = 
	 protocol_icmp = 
	 protocol_tcp = 
	 source_tags = 
}
```
## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | n/a | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | n/a | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | n/a | `set(string)` | n/a | yes |
| <a name="input_protocol_icmp"></a> [protocol\_icmp](#input\_protocol\_icmp) | n/a | `string` | n/a | yes |
| <a name="input_protocol_tcp"></a> [protocol\_tcp](#input\_protocol\_tcp) | n/a | `string` | n/a | yes |
| <a name="input_source_tags"></a> [source\_tags](#input\_source\_tags) | n/a | `set(string)` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | Firewall ID |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->