output "certificate" {
  value = cloudflare_origin_ca_certificate.tripstagger.certificate
}

output "pem" {
  value = nonsensitive(tls_private_key.tripstagger.private_key_pem)
}