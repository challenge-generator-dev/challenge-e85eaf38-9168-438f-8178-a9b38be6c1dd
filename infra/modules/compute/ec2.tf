# Superficie de práctica: definición de instancias EC2 para el servicio de órdenes
# El estudiante debe implementar la configuración completa de las instancias

variable "subnet_ids" {
  description = "IDs de las subredes donde se aprovisionarán las instancias"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups para las instancias"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.medium"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI a utilizar para las instancias"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI, reemplazar por AMI real
}

variable "instance_count" {
  description = "Número de instancias a crear"
  type        = number
  default     = 2
}

variable "key_name" {
  description = "Nombre del par de claves SSH para acceso"
  type        = string
  default     = ""
}

# TODO: Implementar Launch Template para las instancias del servicio de órdenes
# El launch template debe incluir:
# - La AMI especificada en la variable
# - El tipo de instancia configurado
# - Los security groups asignados
# - Storage configurado apropiadamente
# - User data script para inicialización básica
# - IAM instance profile (referenciar el módulo de IAM)
# - Tags con información del entorno y servicio

# TODO: Implementar Auto Scaling Group
# El ASG debe:
# - Usar el launch template creado
# - Usar subredes privadas
# - Tener mínimo 2 instancias
# - Tener máximo 4 instancias
# - Usar métricas de CloudWatch para scaling
# - Incluir políticas de scaling (scale-up y scale-down)
# - Tags para identificación

# TODO: Configurar Health Checks
# - Usar ELB health checks
# - Intervalo y umbrales apropiados

# Outputs
export "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = aws_autoscaling_group.orders_service.name
}

export "instance_ids" {
  description = "IDs de las instancias creadas"
  value       = aws_instance.orders_service[*].id
}