# Superficie de práctica: definición de security groups para el servicio de órdenes
# El estudiante debe implementar las reglas de tráfico necesarias

variable "vpc_id" {
  description = "ID de la VPC donde se crearán los security groups"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

# TODO: Implementar Security Group para el Application Load Balancer
# Reglas necesarias:
# - Inbound: HTTP (80) desde cualquier parte (0.0.0.0/0)
# - Inbound: HTTPS (443) desde cualquier parte (0.0.0.0/0)
# - Outbound: todo el tráfico permitido hacia dentro de la VPC

# TODO: Implementar Security Group para las instancias EC2 del servicio de órdenes
# Reglas necesarias:
# - Inbound: HTTP (80) desde el ALB security group
# - Inbound: HTTPS (443) desde el ALB security group
# - Inbound: SSH (22) desde la VPC o IP específica de administración
# - Outbound: todo el tráfico saliente permitido

# TODO: Implementar Security Group para la capa de datos (RDS/ElastiCache)
# Reglas necesarias:
# - Inbound: Puerto de PostgreSQL (5432) desde el security group de EC2
# - Inbound: Puerto de Redis/Memcached desde el security group de EC2

# Outputs para exportar los IDs de los security groups
export "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

export "ec2_security_group_id" {
  description = "ID del security group de las instancias EC2"
  value       = aws_security_group.ec2.id
}

export "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database.id
}