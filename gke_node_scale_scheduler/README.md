# Terraform Module for GKE Node Scale Scheduler

## Introduction

Module responsible for schedule GKE Node Scale.

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 scheduler_code_bucket_name = 

	 # Optional variables
	 cluster_nodes_list = {}
	 project_id = ""
	 region = ""
	 scheduler_start_cron_expr = "0 8 * * 1-5"
	 scheduler_stop_cron_expr = "0 18 * * 1-5"
	 scheduler_time_zone = "America/Sao_Paulo"
}
```
## Resources

| Name | Type |
|------|------|
| [google-beta_google_pubsub_topic.topic](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_pubsub_topic) | resource |
| [google_cloud_scheduler_job.job_start](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloud_scheduler_job.job_stop](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloudfunctions_function.gke_node_scale_scheduler](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_project_iam_member.cloudfunction_invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cluster_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.cb](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.cf](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.cs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.zip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [archive_file.source](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_nodes_list"></a> [cluster\_nodes\_list](#input\_cluster\_nodes\_list) | Cluster Nodes List to Scale | <pre>map(object({<br>    project_id                = string,<br>    cluster_id                = string,<br>    node_pool_id              = string,<br>    location                  = string,<br>    node_count                = number,<br>    scheduler_start_cron_expr = string,<br>    scheduler_stop_cron_expr  = string,<br>    scheduler_time_zone       = string,<br>  }))</pre> | `{}` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |
| <a name="input_scheduler_code_bucket_name"></a> [scheduler\_code\_bucket\_name](#input\_scheduler\_code\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_scheduler_start_cron_expr"></a> [scheduler\_start\_cron\_expr](#input\_scheduler\_start\_cron\_expr) | n/a | `string` | `"0 8 * * 1-5"` | no |
| <a name="input_scheduler_stop_cron_expr"></a> [scheduler\_stop\_cron\_expr](#input\_scheduler\_stop\_cron\_expr) | n/a | `string` | `"0 18 * * 1-5"` | no |
| <a name="input_scheduler_time_zone"></a> [scheduler\_time\_zone](#input\_scheduler\_time\_zone) | n/a | `string` | `"America/Sao_Paulo"` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->