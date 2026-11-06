# Superficie de práctica: aprovisionamiento de VPC con subredes públicas y privadas
# El estudiante debe implementar la definición completa de los recursos

# Variables de entrada para la VPC
variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# TODO: Implementar el recurso aws_vpc con el bloque CIDR proporcionado
# El recurso debe incluir:
# - El bloque CIDR configurable mediante variable
# - habilitar_dns_hostnames = true
# - habilitar_dns_support = true
# - Tags con nombre significativo que incluya el entorno

# TODO: Implementar subredes públicas
# Crear una subred pública por zona de disponibilidad:
# - Deben tener asignación automática de IPs públicas
# - Tags indicando tipo = "publica" y entorno

# TODO: Implementar subredes privadas
# Crear una subred privada por zona de disponibilidad:
# - Sin asignación automática de IPs públicas
# - Tags indicando tipo = "privada" y entorno

# TODO: Implementar Internet Gateway
# Crear y adjuntar un Internet Gateway a la VPC

# TODO: Implementar tablas de rutas
# - Tabla de rutas para subredes públicas指向 Internet Gateway
# - Tabla de rutas para subredes privadas (puede ser la misma o diferente)

# Output para exponer el ID de la VPC
export "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}