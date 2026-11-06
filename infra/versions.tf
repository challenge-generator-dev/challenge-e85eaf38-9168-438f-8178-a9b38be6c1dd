terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.65"
    }
  }
}

// Configuración del provider AWS
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "servicio-ordenes"
      ManagedBy   = "terraform"
    }
  }
}

// Configuración de backend para almacenamiento del estado
terraform {
  backend "s3" {
    bucket         = "terraform-state-${var.environment}"
    key            = "infra/state.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}