variable "firewall_name" {
  type = string
}

variable "network" {
  type = string
}

variable "protocol_icmp" {
  type = string
}

variable "protocol_tcp" {
  type = string
}

variable "ports" {
  type = set(string)
}

variable "source_tags" {
  type = set(string)
}

