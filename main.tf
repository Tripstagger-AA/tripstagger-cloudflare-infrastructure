data "cloudflare_zone" "zone" {
  name = var.host_name
}

resource "tls_private_key" "tripstagger" {
  algorithm = "RSA"
}

resource "tls_cert_request" "tripstagger" {
  private_key_pem = tls_private_key.tripstagger.private_key_pem

  subject {
    common_name  = "*.${var.host_name}"
    organization = var.organization
  }
}

resource "cloudflare_origin_ca_certificate" "tripstagger" {
  csr                = tls_cert_request.tripstagger.cert_request_pem
  hostnames          = [var.host_name, "*.${var.host_name}"]
  request_type       = "origin-rsa"
  requested_validity = var.cert_days
}

resource "cloudflare_zone_settings_override" "tripstagger" {
  zone_id = data.cloudflare_zone.zone.zone_id

  settings {
    always_use_https = "on"
    ssl              = "full"
  }
}


module "dnsrecod" {
  source            = "./dnsrecord"
  count             = length(local.dns_names)
  server_ip_address = var.server_ip_address
  dns_name          = tolist(local.dns_names)[count.index]
  host_name         = var.host_name
  subdomain         = tolist(local.subdomains)[count.index]
  zone_id           = data.cloudflare_zone.zone.zone_id
  providers = {
    cloudflare = cloudflare
  }
}