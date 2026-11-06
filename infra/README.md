# Infraestructura Terraform para el Servicio de Órdenes

Este directorio contiene la configuración de infraestructura como código utilizando Terraform para aprovisionar los recursos de AWS necesarios para el servicio de órdenes.

## Estructura del Proyecto

```
infra/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   │   ├── main.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       └── terraform.tfvars
├── modules/
│   ├── network/
│   │   ├── vpc.tf
│   │   └── security_groups.tf
│   ├── compute/
│   │   ├── ec2.tf
│   │   └── iam.tf
│   └── load_balancer/
│       └── alb.tf
├── providers.tf
├── variables.tf
├── versions.tf
├── main.tf
└── outputs.tf
```

## Requisitos Previos

- Terraform >= 1.9.0 instalado localmente
- Credenciales de AWS configuradas (AWS CLI o variables de entorno)
- Acceso a la cuenta de AWS con permisos suficientes para crear recursos

## Configuración de Credenciales AWS

Existen varias formas de configurar las credenciales:

### Opción 1: AWS CLI

```bash
aws configure
```

### Opción 2: Variables de entorno

```bash
export AWS_ACCESS_KEY_ID="tu-access-key"
export AWS_SECRET_ACCESS_KEY="tu-secret-key"
export AWS_REGION="us-east-1"
```

### Opción 3: Perfiles nomeados

```bash
export AWS_PROFILE="tu-perfil"
```

## Inicialización del Entorno

Para comenzar a trabajar con Terraform en un entorno específico:

```bash
cd infra/environments/dev
terraform init
```

El comando `terraform init` descarga los proveedores necesarios y inicializa el backend.

## Planificar Cambios

Antes de aplicar cualquier cambio, siempre es recomendable revisar el plan:

```bash
cd infra/environments/dev
terraform plan
```

El plan muestra todos los recursos que se crearán, modificarán o destruirán.

## Aplicar Cambios

Para aplicar los cambios definidos en la configuración:

```bash
cd infra/environments/dev
terraform apply
```

Terraform mostrará el plan y solicitará confirmación antes de proceder.

## Trabajando con Different Entornos

### Desarrollo (dev)

```bash
cd infra/environments/dev
terraform init
terraform plan
terraform apply
```

### Staging

```bash
cd infra/environments/staging
terraform init
terraform plan
terraform apply
```

### Producción

```bash
cd infra/environments/prod
terraform init
terraform plan
terraform apply
```

## Variables de Configuración

Las variables específicas de cada entorno se definen en el archivo `terraform.tfvars` de cada directorio de entorno. Estas incluyen:

- Identificador del entorno (dev, staging, prod)
- Configuración de red (CIDR, subnets)
- Tipo de instancia para EC2
- Configuración del balanceador de carga

## Outputs Disponibles

Después de aplicar la configuración, Terraform expone los siguientes outputs:

- ID de la VPC creada
- IDs de las subnets
- ID del Security Group del ALB
- DNS del Application Load Balancer
- ID de la instancia EC2

Para ver los outputs:

```bash
cd infra/environments/dev
terraform output
```

## Destrucción de Recursos

Para eliminar todos los recursos creados por Terraform:

```bash
cd infra/environments/dev
terraform destroy
```

**Advertencia**: Esta acción es irreversible. Asegúrate de tener backups de los datos importantes.

## Mejores Prácticas

1. **Siempre revisar el plan antes de aplicar**: Ejecuta `terraform plan` y revisa cuidadosamente los cambios propuestos.

2. **Usar workspaces para entornos**: Considera usar Terraform workspaces para gestionar múltiples entornos desde la misma configuración.

3. **Versionar el estado**: Configura un backend remoto (S3 con DynamoDB para locking) para almacenar el estado de Terraform.

4. **No guardar secrets en tfvars**: Usa variables de entorno o integración con AWS Secrets Manager para información sensible.

5. **Mantener módulos reutilizables**: Los módulos en `modules/` deben ser genéricos y configurables mediante variables.

## Comandos Útiles

| Comando | Descripción |
|---------|-------------|
| `terraform init` | Inicializa el directorio de trabajo |
| `terraform validate` | Valida la sintaxis de los archivos |
| `terraform plan` | Crea un plan de ejecución |
| `terraform apply` | Aplica los cambios |
| `terraform destroy` | Destruye los recursos |
| `terraform output` | Muestra los outputs |
| `terraform state list` | Lista recursos en el estado |
| `terraform graph` | Genera un grafo de dependencias |

## Referencias Externas

- Documentación oficial de Terraform: https://www.terraform.io/docs
- Provider AWS: https://registry.terraform.io/providers/hashicorp/aws
- Mejores prácticas de Terraform: https://www.terraform.io/docs/cloud/guides/recommended-practices.html