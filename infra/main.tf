// Configuración principal de Terraform para el servicio de órdenes
// Este archivo define los recursos base de infraestructura

// Módulo de red VPC
module "network" {
  source = "../modules/network"

  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnets        = var.public_subnets
  private_subnets       = var.private_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
}

// Módulo de compute (EC2, ECS, etc.)
module "compute" {
  source = "../modules/compute"

  environment         = var.environment
  vpc_id              = module.network.vpc_id
  subnet_ids          = module.network.private_subnet_ids
  instance_type       = var.instance_type
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  ami_id              = var.ami_id
  key_name            = var.key_name
  security_groups     = module.network.security_group_ids
}

// Módulo de balanceador de carga
module "load_balancer" {
  source = "../modules/load_balancer"

  environment       = var.environment
  vpc_id            = module.network.vpc_id
  subnet_ids        = module.network.public_subnet_ids
  instance_ids      = module.compute.instance_ids
  alb_type          = var.alb_type
  listener_port     = var.listener_port
  target_group_port = var.target_group_port
  health_check_path = var.health_check_path
  ssl_certificate_arn = var.ssl_certificate_arn
  enable_deletion_protection = var.enable_deletion_protection
}

// Recursos adicionales de infraestructura

// Bucket S3 para logs
resource "aws_s3_bucket" "logs" {
  bucket = "servicio-ordenes-logs-${var.environment}"

  tags = {
    Name        = "servicio-ordenes-logs-${var.environment}"
    Environment = var.environment
    Project     = "servicio-ordenes"
  }
}

resource "aws_s3_bucket_versioning" "logs" {
  bucket = aws_s3_bucket.logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

// Bucket S3 para artefactos
resource "aws_s3_bucket" "artefactos" {
  bucket = "servicio-ordenes-artefactos-${var.environment}"

  tags = {
    Name        = "servicio-ordenes-artefactos-${var.environment}"
    Environment = var.environment
    Project     = "servicio-ordenes"
  }
}

// DynamoDB para tabla de órdenes
resource "aws_dynamodb_table" "ordenes" {
  name           = "ordenes-${var.environment}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  range_key      = "cliente_id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "cliente_id"
    type = "S"
  }

  attribute {
    name = "estado"
    type = "S"
  }

  attribute {
    name = "fecha_creacion"
    type = "S"
  }

  global_secondary_index {
    name            = "estado-index"
    hash_key        = "estado"
    range_key       = "fecha_creacion"
    projection_type = "ALL"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = {
    Name        = "ordenes-${var.environment}"
    Environment = var.environment
    Project     = "servicio-ordenes"
  }
}

// SNS para notificaciones de órdenes
resource "aws_sns_topic" "ordenes_notificaciones" {
  name = "ordenes-notificaciones-${var.environment}"

  tags = {
    Name        = "ordenes-notificaciones-${var.environment}"
    Environment = var.environment
    Project     = "servicio-ordenes"
  }
}