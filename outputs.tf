output "certificate" {
  value = cloudflare_origin_ca_certificate.tripstagger.certificate
}

output "serial" {
  value = cloudflare_origin_ca_certificate.tripstagger.id
}