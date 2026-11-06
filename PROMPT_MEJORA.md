# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/vpc.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/security_groups.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/ec2.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/iam.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/load_balancer/alb.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/staging/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/prod/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos corruptos — arreglar primero

El contenido no corresponde a la extension. Regeneralos completos:

- `infra/src/main/java/Application.java` — El contenido no corresponde a un archivo java. Hay que regenerarlo completo.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setId`: Se invoca `setId` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setCreatedAt`: Se invoca `setCreatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setUpdatedAt`: Se invoca `setUpdatedAt` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `api/src/main/java/com/orders/api/application/OrderService.java` — `Order.setTotalAmount`: Se invoca `setTotalAmount` sobre `Order`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Backend, Especialidad Desarrollador, Tecnología Java, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261106160222034), Aprovisiona con Terraform la infraestructura AWS que necesita el servicio de ordenes

### Misión / candidato
Versionar la infraestructura del servicio

### Reto
- Tema: Infraestructura como codigo para el servicio de ordenes
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura con Terraform para el servicio de ordenes
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform para aprovisionar la infraestructura AWS. — entregable (NO resolver): Entorno de Terraform configurado y conectado a la cuenta de AWS.
- Fase 2: Definición de recursos de infraestructura — objetivo: Definir los recursos de infraestructura necesarios para el servicio de ordenes en Terraform. — entregable (NO resolver): Archivo `main.tf` con los recursos de infraestructura definidos para el servicio de ordenes.
- Fase 3: Aplicación y versionado de la infraestructura — objetivo: Aplicar la configuración de Terraform y versionar la infraestructura del servicio de ordenes. — entregable (NO resolver): Infraestructura aprovisionada y versionada en un repositorio de control de versiones.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/src/main/resources/application.yml ===
# Configuración base para Spring Boot
# ===================================
spring:
  application:
    name: aws-infra-service
  
  # Configuración de datasource (PostgreSQL)
  datasource:
    url: jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}
    username: ${DB_USER}
    password: ${DB_PASSWORD}
    driver-class-name: org.postgresql.Driver
    hikari:
      maximum-pool-size: 10
      minimum-idle: 2
      idle-timeout: 30000
      connection-timeout: 30000
      max-lifetime: 600000

  # Configuración de JPA/Hibernate
  jpa:
    database-platform: org.hibernate.dialect.PostgreSQLDialect
    hibernate:
      ddl-auto: validate
    show-sql: false
    properties:
      hibernate:
        format_sql: true
        jdbc:
          batch_size: 20
        order_inserts: true
        order_updates: true

# Configuración de Actuator
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  endpoint:
    health:
      show-details: always

# Configuración de logging
logging:
  level:
    root: INFO
    org.springframework: INFO
    com.amazonaws: DEBUG
    org.hibernate: ERROR

# Configuración específica para AWS
aws:
  region: ${AWS_REGION}
  credentials:
    access-key: ${AWS_ACCESS_KEY_ID}
    secret-key: ${AWS_SECRET_ACCESS_KEY}
  
# Configuración para OpenAPI/Swagger
springdoc:
  api-docs:
    path: /api-docs
  swagger-ui:
    path: /swagger-ui.html
    operationsSorter: alpha
    tagsSorter: alpha
    docExpansion: none

// === ARCHIVO: infra/src/main/java/Application.java ===
// Este archivo NO APLICA para el stack declarado (Terraform/AWS Provider).
// En proyectos Terraform el punto de entrada es el comando `terraform apply`
// ejecutado desde la raíz del proyecto, no un archivo de código Java.
// 
// El archivo solicitado (`Application.java`) es un componente requerido para
// stacks basados en Spring Boot/Java, pero este proyecto es 100% Terraform.

// Dado que la propuesta arquitectónica no aplica, se retorna baseCode: null
// según las reglas de HU-CG-005 y el contrato de salida.

// === ARCHIVO: infra/pom.xml ===
<!--
  ERROR DE ECOSISTEMA: Terraform usa un stack basado en HCL y AWS Provider, no Java/Maven.
  El manifiesto de dependencias en Terraform se gestiona mediante `terraform init`
  usando los archivos `.tf` existentes (providers.tf, versions.tf).
  
  Este proyecto NO requiere pom.xml porque NO es un proyecto Java.
  El comando de verificación para Terraform es `terraform init && terraform validate`.
-->

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/versions.tf ===
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

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/environments/dev/main.tf ===
# Configuración específica para el entorno de desarrollo
# Este archivo define los recursos y configuraciones particulares del ambiente de desarrollo

# =============================================================================
# RECURSOS DE DESARROLLO - STUB
# =============================================================================
# El estudiante debe implementar la configuración de Terraform para el entorno
# de desarrollo, incluyendo:
#
# - Definición de recursos específicos de desarrollo
# - Configuración de variables de entorno
# - Ajustes de recursos para menor costo
# - Políticas de retención de logs
#
# Este es el punto de entrada para el aprovisionamiento de recursos en
# el entorno de desarrollo del servicio de órdenes.

# TODO: Implementar configuración de recursos de desarrollo
# - VPC y subnets específicas del entorno
# - Instancias EC2 con configuración de desarrollo
# - Base de datos con recursos reducidos
# - Balanceador de carga para pruebas

// === ARCHIVO: infra/environments/staging/main.tf ===
# Configuración específica para el entorno de staging
# Este archivo define los recursos y configuraciones particulares del ambiente de staging

# =============================================================================
# RECURSOS DE STAGING - STUB
# =============================================================================
# El estudiante debe implementar la configuración de Terraform para el entorno
# de staging, incluyendo:
#
# - Recursos con configuración similar a producción pero menor escala
# - Configuración de monitoreo y alertas
# - Políticas de respaldo y recuperación
# - Pruebas de integración antes de producción
#
# Este entorno sirve como validación previa a producción para el
# servicio de órdenes.

# TODO: Implementar configuración de recursos de staging
# - VPC y subnets con configuración de staging
# - Instancias EC2 con configuración intermedia
# - Base de datos con replicación
# - Balanceador de carga con configuración de staging

// === ARCHIVO: infra/environments/prod/main.tf ===
# Configuración específica para el entorno de producción
# Superficie de práctica: el estudiante debe implementar los recursos de infraestructura

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.65"
    }
  }

  backend "s3" {
    bucket = "terraform-state-prod-${var.project_name}"
    key    = "environments/prod/terraform.tfstate"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "production"
      ManagedBy   = "terraform"
      Project     = var.project_name
      Tier        = "production"
    }
  }

  skip_credentials_validation = var.skip_credentials_validation
  skip_requesting_account_id  = var.skip_requesting_account_id
  skip_metadata_api_check     = var.skip_metadata_api_check
}

# Datos de la AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Récursos de red
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc-prod"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-prod-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.project_name}-private-subnet-prod-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw-prod"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt-prod"
  }
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Grupos de seguridad
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg-prod"
  description = "Security group para el Application Load Balancer de producción"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg-prod"
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.project_name}-ec2-sg-prod"
  description = "Security group para las instancias EC2 de producción"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP desde ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description     = "HTTPS desde ALB"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg-prod"
  }
}

# Instancias EC2
resource "aws_instance" "orders_service" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[count.index % 2].id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker.io docker-compose
              systemctl start docker
              systemctl enable docker
              EOF

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-orders-service-${count.index + 1}"
  }
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.project_name}-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name = "${var.project_name}-alb-prod"
  }
}

resource "aws_lb_target_group" "orders" {
  name     = "${var.project_name}-tg-prod"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.project_name}-tg-prod"
  }
}

resource "aws_lb_target_group_attachment" "orders" {
  count            = aws_instance.orders_service.count
  target_group_arn = aws_lb_target_group.orders.arn
  target_id        = aws_instance.orders_service[count.index].id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders.arn
  }
}

# RDS PostgreSQL
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-prod"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "${var.project_name}-db-subnet-prod"
  }
}

resource "aws_db_instance" "orders" {
  identifier     = "${var.project_name}-orders-db-prod"
  engine         = "postgres"
  engine_version = "15.4"
  instance_class = var.db_instance_class

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  backup_retention_period = var.db_backup_retention_period
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot       = false
  final_snapshot_identifier = "${var.project_name}-orders-db-prod-final"

  tags = {
    Name = "${var.project_name}-orders-db-prod"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-sg-prod"
  description = "Security group para RDS de producción"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "PostgreSQL desde EC2"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-rds-sg-prod"
  }
}

# ElastiCache Redis
resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.project_name}-redis-subnet-prod"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "${var.project_name}-redis-subnet-prod"
  }
}

resource "aws_elasticache_replication_group" "orders" {
  replication_group_id       = "${var.project_name}-orders-redis-prod"
  replication_group_description = "Redis para el servicio de órdenes de producción"

  engine               = "redis"
  engine_version       = "7.0"
  node_type            = var.redis_node_type
  number_cache_clusters = 2

  port                 = 6379
  parameter_group_name = "default.redis7.cluster.on"
  at_rest_encryption   = true
  transit_encryption   = true
  auth_token_enabled   = true

  subnet_group_name  = aws_elasticache_subnet_group.main.name
  security_group_ids = [aws_security_group.redis.id]

  automatic_failover_enabled = true
  multi_az_enabled           = true

  snapshot_retention_limit   = var.redis_snapshot_retention
  snapshot_window            = "03:00-05:00"
  maintenance_window         = "mon:05:00-mon:07:00"

  tags = {
    Name = "${var.project_name}-orders-redis-prod"
  }
}

resource "aws_security_group" "redis" {
  name        = "${var.project_name}-redis-sg-prod"
  description = "Security group para ElastiCache de producción"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Redis desde EC2"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-redis-sg-prod"
  }
}

# Outputs
output "vpc_id" {
  description = "ID de la VPC de producción"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "orders_service_instance_ips" {
  description = "IPs privadas de las instancias del servicio de órdenes"
  value       = aws_instance.orders_service[*].private_ip
}

output "orders_service_instance_ids" {
  description = "IDs de las instancias EC2 del servicio de órdenes"
  value       = aws_instance.orders_service[*].id
}

output "db_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = aws_db_instance.orders.endpoint
  sensitive   = true
}

output "db_name" {
  description = "Nombre de la base de datos"
  value       = aws_db_instance.orders.db_name
}

output "redis_endpoint" {
  description = "Endpoint de ElastiCache Redis"
  value       = aws_elasticache_replication_group.orders.primary_endpoint_address
  sensitive   = true
}

output "redis_reader_endpoint" {
  description = "Endpoint de lectura de ElastiCache Redis"
  value       = aws_elasticache_replication_group.orders.reader_endpoint_address
  sensitive   = true
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

// === ARCHIVO: infra/modules/network/vpc.tf ===
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

// === ARCHIVO: infra/modules/network/security_groups.tf ===
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

// === ARCHIVO: infra/modules/compute/ec2.tf ===
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

// === ARCHIVO: infra/modules/compute/iam.tf ===
# Stub: Roles y políticas IAM para compute
# Superficie de práctica - implementar según requisitos del servicio de órdenes

# TODO: Definir rol IAM para instancias EC2
# TODO: Crear políticas para acceso a RDS, SQS, SNS
# TODO: Configurar instance profile

// === ARCHIVO: infra/modules/load_balancer/alb.tf ===
# Stub: Application Load Balancer para el servicio de órdenes
# Superficie de práctica - implementar según requisitos del servicio

# TODO: Crear ALB con listener y target groups
# TODO: Configurar security groups para el ALB
# TODO: Definir health checks para el servicio de órdenes

// === ARCHIVO: api/pom.xml ===
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>
    
    <groupId>com.orders</groupId>
    <artifactId>api</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>orders-api</name>
    <description>API para el servicio de órdenes</description>
    
    <properties>
        <java.version>21</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    </properties>
    
    <dependencies>
        <!-- Spring Boot Starters -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        
        <!-- PostgreSQL -->
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <scope>runtime</scope>
        </dependency>
        
        <!-- Lombok -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <scope>provided</scope>
        </dependency>
        
        <!-- Test -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

// === ARCHIVO: api/src/main/java/com/orders/api/Application.java ===
package com.orders.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
    
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        .allowedHeaders("*");
            }
        };
    }
}

// === ARCHIVO: api/src/main/resources/application.yml ===
spring:
  application:
    name: orders-api
  
  datasource:
    url: jdbc:postgresql://localhost:5432/orders_db
    username: ${DB_USERNAME:postgres}
    password: ${DB_PASSWORD:postgres}
    driver-class-name: org.postgresql.Driver
    
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
        format_sql: true

server:
  port: 8080
  servlet:
    context-path: /api

management:
  endpoints:
    web:
      exposure:
        include: "*"
  endpoint:
    health:
      show-details: always

// === ARCHIVO: api/src/main/java/com/orders/api/domain/Order.java ===
package com.orders.api.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotNull
    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    @NotNull
    @PositiveOrZero
    private BigDecimal totalAmount;

    @NotNull
    @Size(min = 1)
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> items;

    @NotNull
    private LocalDateTime createdAt;

    @NotNull
    private LocalDateTime updatedAt;

    public Order() {
        this.status = OrderStatus.CREATED;
        this.totalAmount = BigDecimal.ZERO;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    public Order(List<OrderItem> items) {
        this();
        this.items = items;
        this.totalAmount = items.stream()
                .map(OrderItem::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public UUID getId() {
        return id;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
        this.updatedAt = LocalDateTime.now();
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
        this.totalAmount = items.stream()
                .map(OrderItem::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        this.updatedAt = LocalDateTime.now();
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public enum OrderStatus {
        CREATED,
        PROCESSING,
        COMPLETED,
        CANCELLED
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/OrderItem.java ===
package com.orders.api.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "order_items")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")
    private Order order;

    @NotNull
    @Size(min = 1, max = 255)
    private String productId;

    @NotNull
    @Positive
    private Integer quantity;

    @NotNull
    @PositiveOrZero
    private BigDecimal unitPrice;

    @NotNull
    @PositiveOrZero
    private BigDecimal totalPrice;

    public OrderItem() {
        this.totalPrice = BigDecimal.ZERO;
    }

    public OrderItem(Order order, String productId, Integer quantity, BigDecimal unitPrice) {
        this.order = order;
        this.productId = productId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.totalPrice = unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public UUID getId() {
        return id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
        this.totalPrice = this.unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
        this.totalPrice = unitPrice.multiply(BigDecimal.valueOf(this.quantity));
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/OrderResponseDTO.java ===
package com.orders.api.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public record OrderResponseDTO(
    UUID id,
    Order.OrderStatus status,
    BigDecimal totalAmount,
    List<OrderItemDTO> items,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public static OrderResponseDTO fromOrder(Order order) {
        List<OrderItemDTO> itemDTOs = order.getItems().stream()
                .map(item -> new OrderItemDTO(
                        item.getProductId(),
                        item.getQuantity(),
                        item.getUnitPrice(),
                        item.getTotalPrice()
                ))
                .toList();

        return new OrderResponseDTO(
                order.getId(),
                order.getStatus(),
                order.getTotalAmount(),
                itemDTOs,
                order.getCreatedAt(),
                order.getUpdatedAt()
        );
    }

    public record OrderItemDTO(
        String productId,
        Integer quantity,
        BigDecimal unitPrice,
        BigDecimal totalPrice
    ) {}
}

// === ARCHIVO: api/src/main/java/com/orders/api/domain/OrderUpdateDTO.java ===
package com.orders.api.domain;

import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.List;

public record OrderUpdateDTO(
    @NotNull
    Order.OrderStatus status,

    @NotEmpty
    List<OrderItemUpdateDTO> items
) {
    public record OrderItemUpdateDTO(
        @NotBlank
        @Size(min = 1, max = 255)
        String productId,

        @NotNull
        @Positive
        Integer quantity,

        @NotNull
        @PositiveOrZero
        BigDecimal unitPrice
    ) {
        public BigDecimal getTotalPrice() {
            return unitPrice.multiply(BigDecimal.valueOf(quantity));
        }
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/OrderRepository.java ===
package com.orders.api.infrastructure;

import com.orders.api.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface OrderRepository extends JpaRepository<Order, UUID> {
}

// === ARCHIVO: api/src/main/java/com/orders/api/application/OrderService.java ===
package com.orders.api.application;



import com.orders.api.domain.OrderItemUpdateDTO;
import com.orders.api.domain.OrderStatus;
import com.orders.api.domain.Order;
import com.orders.api.domain.OrderItem;
import com.orders.api.domain.OrderResponseDTO;
import com.orders.api.domain.OrderUpdateDTO;
import com.orders.api.domain.OrderResponseDTO.OrderItemDTO;
import com.orders.api.infrastructure.OrderRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(List<OrderItemDTO> itemsDTO) {
        if (itemsDTO == null || itemsDTO.isEmpty()) {
            throw new IllegalArgumentException("La orden debe contener al menos un artículo");
        }

        List<OrderItem> items = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        Order order = new Order();
        order.setId(UUID.randomUUID());
        order.setCreatedAt(LocalDateTime.now());
        order.setUpdatedAt(LocalDateTime.now());
        order.setStatus(Order.OrderStatus.PENDING);

        for (OrderItemDTO itemDTO : itemsDTO) {
            if (itemDTO.productId() == null || itemDTO.productId().isBlank()) {
                throw new IllegalArgumentException("El productId no puede estar vacío");
            }
            if (itemDTO.quantity() == null || itemDTO.quantity() <= 0) {
                throw new IllegalArgumentException("La cantidad debe ser mayor a 0");
            }
            if (itemDTO.unitPrice() == null || itemDTO.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                throw new IllegalArgumentException("El precio unitario debe ser mayor a 0");
            }

            BigDecimal itemTotal = itemDTO.unitPrice().multiply(BigDecimal.valueOf(itemDTO.quantity()));
            totalAmount = totalAmount.add(itemTotal);

            OrderItem item = new OrderItem(order, itemDTO.productId(), itemDTO.quantity(), itemDTO.unitPrice());
            items.add(item);
        }

        order.setItems(items);
        order.setTotalAmount(totalAmount);

        Order savedOrder = orderRepository.save(order);
        return OrderResponseDTO.fromOrder(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        return orderRepository.findById(id).map(OrderResponseDTO::fromOrder);
    }

    public Optional<OrderResponseDTO> updateOrder(UUID id, OrderUpdateDTO updateDTO) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }
        if (updateDTO == null) {
            throw new IllegalArgumentException("Los datos de actualización no pueden ser nulos");
        }

        return orderRepository.findById(id).map(existingOrder -> {
            if (updateDTO.status() != null) {
                try {
                    existingOrder.setStatus(Order.OrderStatus.valueOf(updateDTO.status()));
                } catch (IllegalArgumentException e) {
                    throw new IllegalArgumentException("Estado de orden inválido: " + updateDTO.status());
                }
            }

            if (updateDTO.items() != null && !updateDTO.items().isEmpty()) {
                List<OrderItem> updatedItems = new ArrayList<>();
                BigDecimal newTotal = BigDecimal.ZERO;

                for (OrderUpdateDTO.OrderItemUpdateDTO itemDTO : updateDTO.items()) {
                    if (itemDTO.productId() == null || itemDTO.productId().isBlank()) {
                        throw new IllegalArgumentException("El productId no puede estar vacío");
                    }
                    if (itemDTO.quantity() == null || itemDTO.quantity() <= 0) {
                        throw new IllegalArgumentException("La cantidad debe ser mayor a 0");
                    }
                    if (itemDTO.unitPrice() == null || itemDTO.unitPrice().compareTo(BigDecimal.ZERO) <= 0) {
                        throw new IllegalArgumentException("El precio unitario debe ser mayor a 0");
                    }

                    BigDecimal itemTotal = itemDTO.unitPrice().multiply(BigDecimal.valueOf(itemDTO.quantity()));
                    newTotal = newTotal.add(itemTotal);

                    OrderItem item = new OrderItem(existingOrder, itemDTO.productId(), itemDTO.quantity(), itemDTO.unitPrice());
                    updatedItems.add(item);
                }

                existingOrder.setItems(updatedItems);
                existingOrder.setTotalAmount(newTotal);
            }

            existingOrder.setUpdatedAt(LocalDateTime.now());
            Order savedOrder = orderRepository.save(existingOrder);
            return OrderResponseDTO.fromOrder(savedOrder);
        });
    }

    public boolean deleteOrder(UUID id) {
        if (id == null) {
            throw new IllegalArgumentException("El ID de la orden no puede ser nulo");
        }

        Optional<Order> orderOpt = orderRepository.findById(id);
        if (orderOpt.isEmpty()) {
            return false;
        }

        Order order = orderOpt.get();
        if (order.getStatus() == Order.OrderStatus.COMPLETED) {
            throw new IllegalStateException("No se puede eliminar una orden completada");
        }

        orderRepository.delete(order);
        return true;
    }

    @Transactional(readOnly = true)
    public List<OrderResponseDTO> getAllOrders() {
        return orderRepository.findAll().stream()
                .map(OrderResponseDTO::fromOrder)
                .collect(Collectors.toList());
    }
}

// === ARCHIVO: api/src/main/java/com/orders/api/infrastructure/OrderController.java ===
package com.orders.api.infrastructure;

import com.orders.api.application.OrderService;
import com.orders.api.domain.OrderResponseDTO;
import com.orders.api.domain.OrderUpdateDTO;
import com.orders.api.domain.OrderResponseDTO.OrderItemDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@RequestBody List<OrderItemDTO> items) {
        if (items == null || items.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }
        OrderResponseDTO createdOrder = orderService.createOrder(items);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdOrder);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable UUID id) {
        return orderService.getOrder(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> updateOrder(
            @PathVariable UUID id,
            @RequestBody OrderUpdateDTO updateDTO) {
        return orderService.updateOrder(id, updateDTO)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable UUID id) {
        try {
            boolean deleted = orderService.deleteOrder(id);
            if (deleted) {
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.notFound().build();
        } catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<OrderResponseDTO>> getAllOrders() {
        List<OrderResponseDTO> orders = orderService.getAllOrders();
        return ResponseEntity.ok(orders);
    }
}
```
