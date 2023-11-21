<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.
## Usage
Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 cpu = 
	 memory = 
	 name = 
	 private_network = 
	 project = 

	 # Optional variables
	 availability_type = "REGIONAL"
	 backup_enabled = "true"
	 backup_location = "us-central1"
	 backup_start_time = "22:00"
	 binary_log_enabled = "false"
	 database_version = "POSTGRES_14"
	 deletion_protection = false
	 disk_autoresize = true
	 disk_autoresize_limit = 0
	 disk_size = 10
	 disk_type = "PD_SSD"
	 ipv4_enabled = "false"
	 point_in_time_recovery_enabled = "true"
	 region = "us-central1"
	 require_ssl = "false"
	 retained_backups = "7"
	 retention_unit = "COUNT"
	 tier = "db-custom"
	 transaction_log_retention_days = "null"
	 user_labels = {}
	 user_password = ""
}
```
## Resources

| Name | Type |
|------|------|
| [google-beta_google_sql_database_instance.postgresql](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_sql_database_instance) | resource |
| [google_secret_manager_secret.postgressql-password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.secret-version-basic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [random_password.user-password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type for the master instance. This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`. | `string` | `"REGIONAL"` | no |
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | n/a | `bool` | `"true"` | no |
| <a name="input_backup_location"></a> [backup\_location](#input\_backup\_location) | n/a | `string` | `"us-central1"` | no |
| <a name="input_backup_start_time"></a> [backup\_start\_time](#input\_backup\_start\_time) | n/a | `string` | `"22:00"` | no |
| <a name="input_binary_log_enabled"></a> [binary\_log\_enabled](#input\_binary\_log\_enabled) | n/a | `bool` | `"false"` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The number of CPU for the master instance. | `number` | n/a | yes |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database version to use | `string` | `"POSTGRES_14"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance. | `bool` | `false` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Configuration to increase storage size. | `bool` | `true` | no |
| <a name="input_disk_autoresize_limit"></a> [disk\_autoresize\_limit](#input\_disk\_autoresize\_limit) | The maximum size to which storage can be auto increased. | `number` | `0` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The disk size for the master instance. | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | n/a | `bool` | `"false"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The number of CPmemoryU for the master instance. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | n/a | `bool` | `"true"` | no |
| <a name="input_private_network"></a> [private\_network](#input\_private\_network) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project ID to manage the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region of the Cloud SQL resources | `string` | `"us-central1"` | no |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl) | n/a | `bool` | `"false"` | no |
| <a name="input_retained_backups"></a> [retained\_backups](#input\_retained\_backups) | n/a | `number` | `"7"` | no |
| <a name="input_retention_unit"></a> [retention\_unit](#input\_retention\_unit) | n/a | `string` | `"COUNT"` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The machine custom type for the master instance. | `string` | `"db-custom"` | no |
| <a name="input_transaction_log_retention_days"></a> [transaction\_log\_retention\_days](#input\_transaction\_log\_retention\_days) | n/a | `string` | `"null"` | no |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | n/a | `map` | `{}` | no |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | The password for the default user. If not set, a random one will be generated and available in the generated\_user\_password output variable. | `string` | `""` | no |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->