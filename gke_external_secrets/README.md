# Terraform Module for GKE External Secrets

## Introduction

Module responsible for instaling GKE External Secrets Operator.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 cluster_location = 
	 cluster_name = 
	 project_id = 
	 secret_sa_content = 

	 # Optional variables
	 namespace = "es"
	 secret_key = "gcp-sa.json"
	 secret_name = "gcp-secret-manager"
	 secret_store_name = "gcp-secret-store"
}
```
## Resources

| Name | Type |
|------|------|
| [helm_release.external_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.secret_sa](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubectl_manifest.secret_store](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [google-beta_google_secret_manager_secret_version.secret_manager_sa_content](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/data-sources/google_secret_manager_secret_version) | data source |
| [google_client_config.client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.gke_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"es"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | `"gcp-sa.json"` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | n/a | `string` | `"gcp-secret-manager"` | no |
| <a name="input_secret_sa_content"></a> [secret\_sa\_content](#input\_secret\_sa\_content) | n/a | `string` | n/a | yes |
| <a name="input_secret_store_name"></a> [secret\_store\_name](#input\_secret\_store\_name) | n/a | `string` | `"gcp-secret-store"` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment"></a> [deployment](#output\_deployment) | The state of deployment |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->