// Outputs para exponer información relevante de la infraestructura
// Otros componentes y equipos pueden consumir estos valores

// Outputs del módulo de red
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "security_group_ids" {
  description = "IDs de los grupos de seguridad"
  value       = module.network.security_group_ids
}

// Outputs del módulo de compute
output "instance_ids" {
  description = "IDs de las instancias EC2"
  value       = module.compute.instance_ids
}

output "instance_ips" {
  description = "IPs privadas de las instancias"
  value       = module.compute.instance_ips
}

output "autoscaling_group_name" {
  description = "Nombre del grupo de auto-scaling"
  value       = module.compute.autoscaling_group_name
}

// Outputs del módulo de balanceador de carga
output "alb_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = module.load_balancer.alb_dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB para Route53"
  value       = module.load_balancer.alb_zone_id
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.load_balancer.alb_arn
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = module.load_balancer.target_group_arn
}

// Outputs de recursos adicionales
output "logs_bucket_name" {
  description = "Nombre del bucket de logs"
  value       = aws_s3_bucket.logs.id
}

output "artefactos_bucket_name" {
  description = "Nombre del bucket de artefactos"
  value       = aws_s3_bucket.artefactos.id
}

output "ordenes_dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB de órdenes"
  value       = aws_dynamodb_table.ordenes.name
}

output "ordenes_dynamodb_table_arn" {
  description = "ARN de la tabla DynamoDB de órdenes"
  value       = aws_dynamodb_table.ordenes.arn
}

output "sns_topic_arn" {
  description = "ARN del topic SNS de notificaciones"
  value       = aws_sns_topic.ordenes_notificaciones.arn
}

output "sns_topic_name" {
  description = "Nombre del topic SNS de notificaciones"
  value       = aws_sns_topic.ordenes_notificaciones.name
}

// Información resumida del entorno
output "environment_summary" {
  description = "Resumen de la configuración del entorno"
  value = {
    environment      = var.environment
    region           = var.aws_region
    vpc_id           = module.network.vpc_id
    alb_dns          = module.load_balancer.alb_dns_name
    dynamodb_table   = aws_dynamodb_table.ordenes.name
    asg_name         = module.compute.autoscaling_group_name
  }
}