variable "project" {
  type        = string
  description = "The project ID to manage the Cloud SQL resources"
}

variable "name" {
  type        = string
  description = "The name of the Cloud SQL resources"
  nullable    = false
}

variable "database_version" {
  default     = "POSTGRES_14"
  type        = string
  description = "The database version to use"
  validation {
    condition     = var.database_version == null ? true : contains(["POSTGRES_9_6", "POSTGRES_10", "POSTGRES_11", "POSTGRES_12", "POSTGRES_13", "POSTGRES_14"], var.database_version)
    error_message = "Allowed values: POSTGRES_9_6, POSTGRES_10, POSTGRES_11, POSTGRES_12, POSTGRES_13, POSTGRES_14."
  }
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "The region of the Cloud SQL resources"

}

variable "tier" {
  type        = string
  default     = "db-custom"
  description = "The machine custom type for the master instance."
}

variable "cpu" {
  type        = number
  description = "The number of CPU for the master instance."
}

variable "memory" {
  type        = string
  description = "The number of CPmemoryU for the master instance."
}

variable "availability_type" {
  description = "The availability type for the master instance. This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`."
  type        = string
  default     = "REGIONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  type        = bool
  default     = true
}

variable "disk_autoresize_limit" {
  description = "The maximum size to which storage can be auto increased."
  type        = number
  default     = 0
}

variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "ipv4_enabled" {
  description = ""
  type        = bool
  default     = "false"
}

variable "require_ssl" {
  description = ""
  type        = bool
  default     = "false"
}

variable "private_network" {
  description = ""
  type        = string
}

variable "binary_log_enabled" {
  description = ""
  type        = bool
  default     = "false"
}

variable "backup_enabled" {
  description = ""
  type        = bool
  default     = "true"
}

variable "backup_start_time" {
  description = ""
  type        = string
  default     = "22:00"
}

variable "backup_location" {
  description = ""
  type        = string
  default     = "us-central1"
}

variable "point_in_time_recovery_enabled" {
  description = ""
  type        = bool
  default     = "true"
}

variable "transaction_log_retention_days" {
  description = ""
  type        = string
  default     = "null"
}

variable "retained_backups" {
  description = ""
  type        = number
  default     = "7"
}

variable "retention_unit" {
  description = ""
  type        = string
  default     = "COUNT"
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = false
}

variable "user_labels" {
  default = {}
}

