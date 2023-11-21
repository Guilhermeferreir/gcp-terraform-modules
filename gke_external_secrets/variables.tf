variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type = string
}

variable "project_id" {
  type = string
}

variable "namespace" {
  type    = string
  default = "es"
}

variable "secret_store_name" {
  type    = string
  default = "gcp-secret-store"
}

variable "secret_name" {
  type    = string
  default = "gcp-secret-manager"
}

variable "secret_key" {
  type    = string
  default = "gcp-sa.json"
}

variable "secret_sa_content" {
  type = string
}

