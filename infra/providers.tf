# Provider de AWS para Terraform
# Configura la conexión con AWS y especifica la región por defecto.
# Utiliza las variables definidas en variables.tf para parametrizar la configuración.

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  
  # Configuración opcional para perfiles de AWS CLI
  # profile = var.aws_profile
  
  # Etiquetas estandarizadas para todos los recursos
  default_tags {
    tags = {
      Environment     = var.environment
      Project         = "order-service"
      Terraform       = "true"
      ManagedBy       = "Terraform"
      CostCenter      = var.cost_center
      Owner           = var.owner
      Compliance      = var.compliance_level
    }
  }
}

# Configuración adicional para el provider de AWS
# Permite personalizar endpoints para servicios específicos (ej. S3, DynamoDB)
# Útil para entornos de desarrollo o pruebas locales.
#
# provider "aws" {
#   alias  = "custom_endpoint"
#   region = var.aws_region
#   endpoints {
#     s3        = "http://localhost:4566"
#     dynamodb  = "http://localhost:4566"
#   }
# }