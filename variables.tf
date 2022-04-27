variable "host_name" {
  type = string
}

variable "organization" {
  type = string
}

variable "cert_days" {
  type    = number
  default = 1095
}

variable "server_ip_address" {
  type = string
}

variable "subdomains" {
  type    = list(string)
  default = []
}