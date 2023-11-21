variable "name" {
  type        = string
  description = "The zone name"
}

variable "dns_name" {
  type        = string
  description = "The DNS name"
}

variable "description" {
  type        = string
  description = "The description of the zone"
}

variable "visibility" {
  type        = string
  description = "The visibility of the zone"
  default     = "private"
}

variable "network" {
  type        = string
  description = "The network name"
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "records" {
  type    = map(any)
  default = {}
}