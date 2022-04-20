terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  email = var.login_email
  api_key = var.login_key
  api_hostname = var.host_name
}