variable "bucket_name" {
  type = string
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "location" {
  type = string
}

variable "storage_class" {
  type    = string
  default = "STANDARD"
}

variable "uniform_bucket_level_access" {
  type    = bool
  default = true
}

variable "public_access_prevention" {
  type    = string
  default = "public_access_prevention"
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "project_id" {
  type = string
}