variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone_instance" {
  type = string
}

variable "image" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "project_id" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}