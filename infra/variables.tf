# Variables para parametrizar la infraestructura de Terraform
# Permiten personalizar la configuración según el entorno (dev, staging, prod).
# Las variables pueden ser sobrescritas mediante archivos .tfvars.

# Variable para la región de AWS
variable "aws_region" {
  description = "La región de AWS donde se aprovisionará la infraestructura"
  type        = string
  default     = "us-east-1"
}

# Variable para el entorno (dev, staging, prod)
variable "environment" {
  description = "El entorno donde se desplegará la infraestructura"
  type        = string
  default     = "dev"
}

# Variable para el bloque CIDR de la VPC
variable "vpc_cidr_block" {
  description = "El bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Variable para los bloques CIDR de las subredes públicas
variable "public_subnet_cidr_blocks" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Variable para los bloques CIDR de las subredes privadas
variable "private_subnet_cidr_blocks" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Variable para el nombre del proyecto
variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
  default     = "order-service"
}

# Variable para el centro de costos
variable "cost_center" {
  description = "Centro de costos para la asignación de recursos"
  type        = string
  default     = "engineering"
}

# Variable para el propietario del recurso
variable "owner" {
  description = "Propietario responsable del recurso"
  type        = string
  default     = "dev-team"
}

# Variable para el nivel de cumplimiento
variable "compliance_level" {
  description = "Nivel de cumplimiento para los recursos (ej. PCI, HIPAA, GDPR)"
  type        = string
  default     = "internal"
}

# Variable para habilitar/deshabilitar el NAT Gateway
variable "enable_nat_gateway" {
  description = "Indica si se debe crear un NAT Gateway"
  type        = bool
  default     = true
}

# Variable para el tipo de instancia EC2
variable "ec2_instance_type" {
  description = "Tipo de instancia EC2 para el servicio de ordenes"
  type        = string
  default     = "t3.micro"
}

# Variable para el número de instancias EC2
variable "ec2_instance_count" {
  description = "Número de instancias EC2 a desplegar"
  type        = number
  default     = 2
}

# Variable para el tamaño del volumen EBS
variable "ebs_volume_size" {
  description = "Tamaño del volumen EBS en GB"
  type        = number
  default     = 8
}

# Variable para el AMI de la instancia EC2
variable "ec2_ami" {
  description = "ID del AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 en us-east-1
}

# Variable para habilitar el balanceador de carga
variable "enable_load_balancer" {
  description = "Indica si se debe crear un Application Load Balancer"
  type        = bool
  default     = true
}

# Variable para el puerto del balanceador de carga
variable "load_balancer_port" {
  description = "Puerto del Application Load Balancer"
  type        = number
  default     = 80
}

# Variable para el protocolo del balanceador de carga
variable "load_balancer_protocol" {
  description = "Protocolo del Application Load Balancer"
  type        = string
  default     = "HTTP"
}