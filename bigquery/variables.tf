variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

variable "dataset_id" {
  type = string
}

variable "description" {
  type = string
}

variable "friendly_name" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}