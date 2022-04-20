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

resource "cloudflare_origin_ca_certificate" "example" {
  csr                = tls_cert_request.example.cert_request_pem
  hostnames          = [ var.host_name, "*.${var.host_name}" ]
  request_type       = "origin-rsa"
  requested_validity = var.cert_days
}