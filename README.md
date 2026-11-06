# Aprovisionamiento de infraestructura con Terraform para el servicio de ordenes

El equipo de desarrollo necesita aprovisionar la infraestructura AWS para el servicio de ordenes utilizando Terraform. El objetivo es versionar la infraestructura del servicio para asegurar su consistencia y replicabilidad en diferentes entornos. Los actores involucrados son el equipo de desarrollo, el equipo de operaciones y el servicio de ordenes. La infraestructura debe ser aprovisionada de manera que pueda ser versionada y desplegada en diferentes entornos (desarrollo, staging, producción).

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el servicio de ordenes |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para aprovisionar la infraestructura AWS.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configurar el entorno de Terraform para conectarse a la cuenta de AWS.
- Crear un archivo `main.tf` con la configuración básica de Terraform.
- Verificar que Terraform pueda autenticarse en la cuenta de AWS.

**Entregable:** Entorno de Terraform configurado y conectado a la cuenta de AWS.

<details>
<summary>Pistas de conocimiento</summary>

- Configuración de variables de entorno para autenticación en AWS.
- Uso de proveedores en Terraform.

</details>

### Fase 2: Definición de recursos de infraestructura

**Objetivo:** Definir los recursos de infraestructura necesarios para el servicio de ordenes en Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Identificar los recursos de infraestructura necesarios para el servicio de ordenes (ej. VPC, subredes, instancias EC2, balances de carga, etc.).
- Definir estos recursos en el archivo `main.tf` utilizando los recursos de Terraform.
- Verificar que los recursos definidos sean correctos y estén bien configurados.

**Entregable:** Archivo `main.tf` con los recursos de infraestructura definidos para el servicio de ordenes.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de recursos de Terraform para definir infraestructura en AWS.
- Configuración de recursos de red en AWS (VPC, subredes, balances de carga).

</details>

### Fase 3: Aplicación y versionado de la infraestructura

**Objetivo:** Aplicar la configuración de Terraform y versionar la infraestructura del servicio de ordenes.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Aplicar la configuración de Terraform para aprovisionar la infraestructura en AWS.
- Versionar el código de Terraform en un repositorio de control de versiones (ej. Git).
- Verificar que la infraestructura aprovisionada sea la esperada y esté correctamente versionada.

**Entregable:** Infraestructura aprovisionada y versionada en un repositorio de control de versiones.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de comandos de Terraform para aplicar la configuración.
- Prácticas de versionado de código en Git.
- Java: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el aprovisionamiento de infraestructura?
- **paraQueSirve**: ¿Para qué se versiona la infraestructura del servicio de ordenes?
- **comoSeUsa**: ¿Cómo se definen los recursos de infraestructura en Terraform?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionado de la infraestructura del servicio de ordenes?

## Criterios de Evaluacion

- Configuración inicial de Terraform.
- Definición de recursos de infraestructura en Terraform.
- Aplicación y versionado de la infraestructura.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
