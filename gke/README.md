# Terraform Module for GKE

## Introduction

Module responsible for creating a GKE Cluster.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 cluster_disk_size_gb = 
	 cluster_disk_type = 
	 cluster_ipv4_cidr_block = 
	 cluster_machine_type = 
	 cluster_master_ipv4_cidr_block = 
	 location = 
	 name = 
	 network = 
	 project = 
	 services_ipv4_cidr_block = 
	 subnetwork = 

	 # Optional variables
	 authorized_ipv4_cidr_block = []
	 autoscaling_profile = "BALANCED"
	 cluster_image_type = "COS_CONTAINERD"
	 cluster_initial_node_count = 1
	 cluster_logging_service = "logging.googleapis.com/kubernetes"
	 cluster_monitoring_service = "monitoring.googleapis.com/kubernetes"
	 cluster_networking_mode = "VPC_NATIVE"
	 enable_private_nodes = true
	 labels = {}
	 max_pods_per_node = 110
	 max_surge = 1
	 max_unavailable = 0
	 node_locations = []
	 node_pools = {}
	 release_channel = "REGULAR"
}
```
## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.gke_cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google-beta_google_container_node_pool.gke_cluster_node](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_node_pool) | resource |
| [google_project_iam_member.cloud_monitoring_metric_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.error_reporting_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.logs_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.storage_object_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [null_resource.previous_sa](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [time_sleep.wait_60_seconds_sa](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_ipv4_cidr_block"></a> [authorized\_ipv4\_cidr\_block](#input\_authorized\_ipv4\_cidr\_block) | n/a | `list(object({ cidr = string, comment = string }))` | `[]` | no |
| <a name="input_autoscaling_profile"></a> [autoscaling\_profile](#input\_autoscaling\_profile) | n/a | `string` | `"BALANCED"` | no |
| <a name="input_cluster_disk_size_gb"></a> [cluster\_disk\_size\_gb](#input\_cluster\_disk\_size\_gb) | n/a | `string` | n/a | yes |
| <a name="input_cluster_disk_type"></a> [cluster\_disk\_type](#input\_cluster\_disk\_type) | n/a | `string` | n/a | yes |
| <a name="input_cluster_image_type"></a> [cluster\_image\_type](#input\_cluster\_image\_type) | n/a | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_cluster_initial_node_count"></a> [cluster\_initial\_node\_count](#input\_cluster\_initial\_node\_count) | n/a | `number` | `1` | no |
| <a name="input_cluster_ipv4_cidr_block"></a> [cluster\_ipv4\_cidr\_block](#input\_cluster\_ipv4\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_cluster_logging_service"></a> [cluster\_logging\_service](#input\_cluster\_logging\_service) | n/a | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_cluster_machine_type"></a> [cluster\_machine\_type](#input\_cluster\_machine\_type) | n/a | `string` | n/a | yes |
| <a name="input_cluster_master_ipv4_cidr_block"></a> [cluster\_master\_ipv4\_cidr\_block](#input\_cluster\_master\_ipv4\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_cluster_monitoring_service"></a> [cluster\_monitoring\_service](#input\_cluster\_monitoring\_service) | n/a | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_cluster_networking_mode"></a> [cluster\_networking\_mode](#input\_cluster\_networking\_mode) | n/a | `string` | `"VPC_NATIVE"` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | n/a | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The region to use | `string` | n/a | yes |
| <a name="input_max_pods_per_node"></a> [max\_pods\_per\_node](#input\_max\_pods\_per\_node) | n/a | `number` | `110` | no |
| <a name="input_max_surge"></a> [max\_surge](#input\_max\_surge) | n/a | `number` | `1` | no |
| <a name="input_max_unavailable"></a> [max\_unavailable](#input\_max\_unavailable) | n/a | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name of the app VPC | `string` | n/a | yes |
| <a name="input_node_locations"></a> [node\_locations](#input\_node\_locations) | n/a | `list(any)` | `[]` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | n/a | <pre>map(object({<br>    preemptible                     = bool<br>    machine_type                    = string<br>    disk_size_gb                    = string<br>    disk_type                       = string<br>    node_count                      = number<br>    autoscaling_enable              = bool<br>    autoscaling_pool_min_node_count = number<br>    autoscaling_pool_max_node_count = number<br>    labels                          = map(string)<br>    taint = list(object(<br>      {<br>        key    = string<br>        value  = string<br>        effect = string<br>      }<br>    ))<br>  }))</pre> | `{}` | no |
| <a name="input_project"></a> [project](#input\_project) | The project ID | `string` | n/a | yes |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | n/a | `string` | `"REGULAR"` | no |
| <a name="input_services_ipv4_cidr_block"></a> [services\_ipv4\_cidr\_block](#input\_services\_ipv4\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name of the app subnet | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The Kubernetes cluster name. |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->