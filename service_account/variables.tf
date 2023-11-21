variable "account_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "roles" {
  type    = set(string)
  default = []
}

variable "project_id" {
  type = string
}