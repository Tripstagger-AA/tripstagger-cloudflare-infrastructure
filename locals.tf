locals {
  dns_names  = tolist(setunion([var.host_name], [for subdomain in var.subdomains : "${subdomain}.${var.host_name}"]))
  subdomains = tolist(setunion([null], [for subdomain in var.subdomains : subdomain]))
}
