variable "project_id" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "scheduler_start_cron_expr" {
  type    = string
  default = "0 8 * * 1-5"
}

variable "scheduler_stop_cron_expr" {
  type    = string
  default = "0 18 * * 1-5"
}

variable "scheduler_time_zone" {
  type    = string
  default = "America/Sao_Paulo"
}

# Cluster Nodes List to Scale
variable "cluster_nodes_list" {
  type = map(object({
    project_id                = string,
    cluster_id                = string,
    node_pool_id              = string,
    location                  = string,
    node_count                = number,
    scheduler_start_cron_expr = string,
    scheduler_stop_cron_expr  = string,
    scheduler_time_zone       = string,
  }))
  default = {}
}

variable "scheduler_code_bucket_name" {
  type     = string
  nullable = false
}