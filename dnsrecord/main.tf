

resource "cloudflare_record" "root" {
  zone_id = var.zone_id
  name    = var.host_name
  value   = var.server_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = var.subdomain != null ? "www.${var.subdomain}" : "www"
  value   = var.host_name
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
