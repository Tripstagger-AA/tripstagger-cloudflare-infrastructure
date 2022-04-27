locals {
  dns_names = setunion([var.host_name], [for subdomain in var.subdomains : "${subdomain}.${var.host_name}"])
}
