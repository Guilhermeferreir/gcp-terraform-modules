variable "vpc_name" {
  type        = string
  description = "The VPC name"
}

variable "delete_default_routes_on_create" {
  type    = bool
  default = false
}

variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "routing_mode" {
  type    = string
  default = "REGIONAL"

}