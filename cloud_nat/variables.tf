variable "region" {
  type = string
}

variable "network" {
  type = string
}

variable "cloud_router_name" {
  type        = string
  description = "The Cloud Router name"
}

variable "cloud_nat_name" {
  type        = string
  description = "The Cloud NAT name"
}

variable "subnetwork" {
  type = string
}

variable "nat_ip_allocate_option" {
  type    = string
  default = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type    = string
  default = "LIST_OF_SUBNETWORKS"
}

variable "source_ip_ranges_to_nat" {
  type    = set(string)
  default = ["ALL_IP_RANGES"]
}