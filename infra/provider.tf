# Specify required provider as maintained by civo
terraform {
  backend "s3" {
    bucket = "tfg-diego-s3"
    key    = "tfg-diego-s3/tfstate"
    region = "us-east-1"
  }
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

# Configure the Civo Provider
provider "civo" {
  token = var.civo_token
  region = "LON1"
}