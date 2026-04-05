terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Última versión estable requerida por la rúbrica
    }
  }
}

# Las credenciales se inyectan vía variables de entorno en GitHub Actions:
# AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN
provider "aws" {
  region = "us-east-1"
}
