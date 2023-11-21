variable "region" {
  type        = string
  description = "The region to use"
}

variable "subnet_cidr" {
  type        = string
  description = "The subnet CIDR"
}

variable "network" {
  type        = string
  description = "The vpc name"
}

variable "subnet_name" {
  type = string
}

variable "private_ip_google_access" {
  type    = bool
  default = true
}