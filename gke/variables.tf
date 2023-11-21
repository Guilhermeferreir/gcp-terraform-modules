variable "project" {
  type        = string
  description = "The project ID"
}

variable "location" {
  type        = string
  description = "The region to use"
}

variable "network" {
  type        = string
  description = "The name of the app VPC"
}

variable "subnetwork" {
  type        = string
  description = "The name of the app subnet"
}

variable "name" {
  type        = string
  nullable    = false
  description = "The name of the cluster"
}

variable "node_locations" {
  type    = list(any)
  default = []
}

variable "cluster_master_ipv4_cidr_block" {
  type     = string
  nullable = false
}

variable "cluster_ipv4_cidr_block" {
  type     = string
  nullable = false
}

variable "services_ipv4_cidr_block" {
  type     = string
  nullable = false
}

variable "authorized_ipv4_cidr_block" {
  type    = list(object({ cidr = string, comment = string }))
  default = []
}

variable "cluster_disk_size_gb" {
  type     = string
  nullable = false
}

variable "cluster_disk_type" {
  type     = string
  nullable = false
}

variable "cluster_machine_type" {
  type     = string
  nullable = false
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "enable_private_nodes" {
  type     = bool
  nullable = false
  default  = true
}

variable "cluster_monitoring_service" {
  type    = string
  default = "monitoring.googleapis.com/kubernetes"
}

variable "cluster_logging_service" {
  type    = string
  default = "logging.googleapis.com/kubernetes"
}

variable "cluster_initial_node_count" {
  type    = number
  default = 1
}

variable "cluster_networking_mode" {
  type    = string
  default = "VPC_NATIVE"
}

variable "cluster_image_type" {
  type    = string
  default = "COS_CONTAINERD"
}

variable "release_channel" {
  type    = string
  default = "REGULAR"
}

variable "max_pods_per_node" {
  type    = number
  default = 110
}

variable "max_surge" {
  type    = number
  default = 1
}

variable "max_unavailable" {
  type    = number
  default = 0
}

variable "node_pools" {
  type = map(object({
    preemptible                     = bool
    machine_type                    = string
    disk_size_gb                    = string
    disk_type                       = string
    node_count                      = number
    autoscaling_enable              = bool
    autoscaling_pool_min_node_count = number
    autoscaling_pool_max_node_count = number
    labels                          = map(string)
    taint = list(object(
      {
        key    = string
        value  = string
        effect = string
      }
    ))
  }))
  default = {}
}

variable "autoscaling_profile" {
  type    = string
  default = "BALANCED"
}