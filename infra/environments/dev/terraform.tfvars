# Variables específicas para el entorno de desarrollo
# Estas variables configuran los recursos de infraestructura para el ambiente de desarrollo

# Configuración del entorno
environment_name = "desarrollo"
environment_type = "dev"

# Configuración de red
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Configuración de compute
instance_type         = "t3.medium"
instance_count        = 2
min_instance_count    = 1
max_instance_count    = 3
autoscaling_enabled   = true

# Configuración de base de datos
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20
db_engine_version     = "15.7"
multi_az              = false

# Configuración del balanceador de carga
alb_enable_deletion_protection = false
alb_cross_zone_enabled         = true

# Configuración de etiquetas
common_tags = {
  Environment = "desarrollo"
  Project     = "servicio-ordenes"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Team        = "platform"
}