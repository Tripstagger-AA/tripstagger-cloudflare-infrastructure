resource "tls_private_key" "tripstagger" {
  algorithm = "RSA"
}

resource "tls_cert_request" "tripstagger" {
  private_key_pem = tls_private_key.tripstagger.private_key_pem

  subject {
    common_name  = ""
    organization = "Terraform Test"
  }
}