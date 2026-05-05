Sí. Como **Rol 1**, tu misión es dejar el PAI perfectamente encarrilado: **alcance, metodología, escenario, entorno, reconocimiento inicial y coordinación técnica**. No eres el responsable principal de explotar vulnerabilidades, pero sí debes preparar todo para que el Rol 2 pueda hacerlo de forma ordenada y para que el Rol 3 pueda documentarlo con evidencias.

El PAI exige explícitamente planificar el escenario, identificar servicios/aplicaciones, analizar vulnerabilidades y controles, definir pruebas, ejecutar evidencias y generar informe técnico reproducible.  Además, el caso de estudio indica que la planificación empieza seleccionando sistema objetivo y entorno de trabajo, normalmente con enfoque **Black Box**, es decir, sin información interna previa del sistema. 

---

# Plan de trabajo detallado — Rol 1

## 0. Tu objetivo como Rol 1

Tu parte debe responder a estas preguntas:

```text
¿Qué vamos a evaluar?
¿Por qué ese objetivo es válido?
Con qué autorización y límites se va a hacer?
Con qué metodología?
Con qué entorno técnico?
Qué información inicial hemos obtenido?
Qué servicios quedan identificados para que el Rol 2 analice vulnerabilidades?
Cómo se relaciona todo con NIST 800-115 y MITRE ATT&CK?
```

Tu entrega dentro del equipo debería producir estos archivos o secciones:

```text
README.md
scope.md
metodologia.md
equipo.md
informe/Informe_Tecnico_PAI5.md
anexos/comandos_ejecutados.md
anexos/tabla_servicios.md
evidencias/entorno/
evidencias/reconocimiento/
evidencias/nmap/
```

---

# Fase 1 — Inicialización y revisión del proyecto

## Objetivo

Comprobar que Codex ha generado bien la estructura inicial y que el repositorio está listo para trabajar.

## Qué tienes que hacer

Entra en el proyecto y revisa que existan estas carpetas:

```text
PAI5-RedTeamPro/
├── README.md
├── scope.md
├── metodologia.md
├── equipo.md
├── informe/
├── evidencias/
├── scripts/
├── anexos/
└── configuraciones/
```

Después, comprueba que los scripts estén presentes:

```bash
ls scripts
```

Y revisa permisos:

```bash
chmod +x scripts/run_recon.sh
chmod +x scripts/run_web_scan.sh
```

## Qué debes dejar hecho

En el `README.md`, asegúrate de que aparece:

* Objetivo del proyecto.
* Advertencia de uso solo en laboratorio autorizado.
* Estructura del repositorio.
* Flujo de trabajo.
* Cómo guardar evidencias.
* Qué contendrá el ZIP final.

## Evidencia que debes guardar

Captura o salida de:

```bash
tree -L 3
```

Guárdala en:

```text
evidencias/entorno/estructura_proyecto.txt
```

---

# Fase 2 — Definir el alcance del proyecto

## Objetivo

Cerrar el documento `scope.md`. Esta es una de tus partes más importantes.

El PAI insiste en que las herramientas solo deben usarse contra sistemas propios o autorizados, porque su mal uso puede afectar a confidencialidad, integridad, disponibilidad o causar denegación de servicio.  Por tanto, el alcance debe estar muy claro.

## Qué tienes que completar

En `scope.md`, rellena:

```text
Security Team: ST__
Integrantes:
- Rol 1: tu nombre
- Rol 2: nombre compañero/a
- Rol 3: nombre compañero/a

Organización evaluada:
- Nombre ficticio
- Tipo de organización pública
- Contexto del sistema

Tipo de prueba:
- Black Box

Sistema objetivo:
- Nombre de la máquina vulnerable
- Fuente de la máquina
- Motivo de elección

Entorno atacante:
- Kali Linux / Parrot / otra distribución
- Versión si se conoce
- Herramientas principales

Red de laboratorio:
- Tipo: Host-only / NAT / red interna
- IP atacante
- IP objetivo
- Rango de red

Pruebas permitidas:
- Reconocimiento
- Fingerprinting
- Escaneo de puertos
- Detección de servicios
- Análisis de vulnerabilidades
- Explotación controlada por Rol 2
- Escalada controlada por Rol 2
- Documentación de evidencias

Pruebas fuera de alcance:
- Sistemas externos
- IPs públicas
- Denegación de servicio
- Ataques destructivos
- Persistencia maliciosa
- Exfiltración real de información sensible
- Evasión de defensas
```

## Redacción recomendada

Puedes usar algo así:

```text
La evaluación se realizará exclusivamente sobre un entorno de laboratorio controlado, compuesto por una máquina atacante y una máquina objetivo vulnerable desplegada localmente. La prueba se plantea con enfoque Black Box, por lo que el equipo actuará como un atacante externo sin conocimiento interno previo del sistema objetivo. Quedan fuera del alcance todos los sistemas no autorizados, direcciones IP públicas, pruebas destructivas, ataques de denegación de servicio y cualquier acción que pueda comprometer servicios reales.
```

## Qué debes entregar

```text
scope.md completo
Sección “Alcance y autorización” del informe rellenada
```

---

# Fase 3 — Elegir y justificar la máquina objetivo

## Objetivo

Seleccionar una máquina vulnerable válida y justificar por qué sirve para el PAI.

El caso de estudio permite usar sistemas propios o entornos preparados como VulnHub, PentesterLab, Kioptrix, UltimateLAMP o similares, pero indica que cada equipo debe escoger un sistema diferente al ilustrado en el proyecto. 

## Criterios para elegir bien

La máquina ideal debe tener:

```text
Servicios variados
Algún servicio web
Posibles CVE documentables
Posible explotación controlada
Posible escalada de privilegios
Facilidad para obtener evidencias
Documentación suficiente para no atascarse
```

## Opciones recomendables

Para este PAI, yo evitaría máquinas excesivamente difíciles. Conviene elegir una que os permita documentar bien:

```text
VulnHub - Kioptrix Level 1
VulnHub - Mr-Robot
VulnHub - Basic Pentesting
Metasploitable2 si el profesor acepta no usar Metasploitable3
DVWA en Docker como entorno web controlado
OWASP Broken Web Apps
```

Mi recomendación práctica: **Kioptrix Level 1** o **Basic Pentesting**. Son suficientemente realistas, tienen servicios interesantes y permiten hacer un informe completo sin perderos demasiado.

## Qué tienes que documentar

En `scope.md` y en el informe:

```text
Nombre de la máquina:
Fuente:
Motivo de elección:
Tipo de sistema:
Servicios esperados, si se conocen:
Justificación académica:
Limitaciones:
```

Ejemplo:

```text
Se ha seleccionado una máquina vulnerable de laboratorio procedente de VulnHub, diseñada específicamente para prácticas de pentesting. Su uso resulta adecuado para el PAI 5 porque permite reproducir un escenario realista de exposición de servicios, reconocimiento, análisis de vulnerabilidades y explotación controlada dentro de un entorno local autorizado.
```

---

# Fase 4 — Preparar el entorno atacante y la red

## Objetivo

Dejar listo el laboratorio y documentarlo.

## Tareas concretas

En tu máquina atacante:

```bash
ip a
hostnamectl
uname -a
nmap --version
nikto -Version
msfconsole --version
python3 --version
```

No pasa nada si alguna herramienta todavía no está instalada. Lo importante es documentarlo.

## Qué debes guardar

Crea un archivo:

```text
evidencias/entorno/versiones_herramientas.txt
```

Con salidas como:

```bash
nmap --version >> evidencias/entorno/versiones_herramientas.txt
python3 --version >> evidencias/entorno/versiones_herramientas.txt
```

## Tabla para el informe

| Elemento               | Valor                     |
| ---------------------- | ------------------------- |
| Máquina atacante       | Kali Linux                |
| Máquina objetivo       | Pendiente                 |
| Tipo de red            | Host-only / NAT interno   |
| Enfoque                | Black Box                 |
| IP atacante            | Pendiente                 |
| IP objetivo            | Pendiente                 |
| Herramientas iniciales | Nmap, Nikto, SearchSploit |

---

# Fase 5 — Redactar la metodología

## Objetivo

Completar `metodologia.md` y la sección de metodología del informe.

La metodología debe apoyarse en **NIST 800-115**, que estructura la evaluación en planificación, ejecución y post-ejecución/reporting. El documento también distingue técnicas de revisión, identificación/análisis y validación, incluyendo escaneo de vulnerabilidades, pruebas web y penetration testing. 

## Qué debes escribir

La metodología debe explicar:

```text
1. Planificación
2. Reconocimiento / Discovery
3. Identificación de servicios
4. Análisis de vulnerabilidades
5. Explotación controlada
6. Escalada de privilegios
7. Post-explotación
8. Reporting
```

## Redacción base

```text
La evaluación seguirá una metodología basada en NIST 800-115, estructurada en tres grandes fases: planificación, ejecución y post-ejecución. Durante la planificación se define el alcance, el escenario, los activos evaluados y las pruebas permitidas. Durante la ejecución se realiza reconocimiento, fingerprinting, identificación de servicios, análisis de vulnerabilidades y validación controlada de hallazgos. Finalmente, en la fase de post-ejecución se analizan los resultados, se estima el riesgo y se elaboran recomendaciones de mitigación.
```

## Cómo meter MITRE ATT&CK

MITRE ATT&CK debe aparecer como marco para explicar tácticas y técnicas. El documento indica que ATT&CK clasifica comportamientos reales de atacantes en tácticas, técnicas y procedimientos, y que las tácticas explican el “por qué” mientras las técnicas explican el “cómo”. 

Redacción posible:

```text
MITRE ATT&CK se utilizará como marco de referencia para contextualizar los hallazgos dentro de tácticas y técnicas reales de adversarios. Cada vulnerabilidad relevante se intentará asociar, cuando proceda, a una táctica y técnica ATT&CK, permitiendo transformar el hallazgo técnico en una cadena de ataque comprensible.
```

## Cómo meter CVE/CVSS/CWE/CISA KEV

Los CVE sirven para justificar vectores reales porque incluyen versión afectada, condiciones de explotación, severidad CVSS y enlaces a PoC o exploits conocidos.  CISA KEV sirve para priorizar vulnerabilidades ya explotadas en el mundo real. 

Redacción posible:

```text
Las vulnerabilidades identificadas se documentarán, cuando sea posible, mediante referencias CVE, puntuación CVSS, debilidad CWE asociada y presencia o no en CISA KEV. Esta información permitirá priorizar los hallazgos en función de su severidad técnica, explotabilidad y evidencia de explotación real.
```

---

# Fase 6 — Ejecutar reconocimiento inicial

## Objetivo

Identificar IP, puertos, servicios y versiones. Esta es la parte técnica principal de tu rol.

Las fases de pentesting incluyen recolección de información para obtener servicios activos, puertos abiertos, mapeo de red y sistema operativo; las herramientas habituales son Nmap, Recon-ng, Shodan, Google Dorks, Maltego, etc., aunque en laboratorio local normalmente usarás Nmap. 

## Paso 6.1 — Identificar IP atacante

Ejecuta:

```bash
ip a
```

Guarda salida:

```bash
ip a > evidencias/entorno/ip_atacante.txt
```

## Paso 6.2 — Identificar IP objetivo

Dependiendo de la red:

```bash
ip route
```

Luego escaneo de red local:

```bash
nmap -sn <RANGO_DE_RED>
```

Ejemplo:

```bash
nmap -sn 192.168.56.0/24
```

Guarda salida:

```bash
nmap -sn 192.168.56.0/24 -oN evidencias/reconocimiento/descubrimiento_red.txt
```

## Paso 6.3 — Comprobar host activo

```bash
ping -c 4 <IP_OBJETIVO>
```

Guardar:

```bash
ping -c 4 <IP_OBJETIVO> > evidencias/reconocimiento/ping_objetivo.txt
```

## Paso 6.4 — Escaneo inicial de puertos comunes

```bash
nmap -sS -T3 <IP_OBJETIVO> -oN evidencias/nmap/puertos_comunes.txt
```

## Paso 6.5 — Escaneo completo de puertos

```bash
nmap -p- -T3 <IP_OBJETIVO> -oN evidencias/nmap/puertos_completos.txt
```

## Paso 6.6 — Detección de versiones

Cuando tengas puertos concretos:

```bash
nmap -sV -sC -p <PUERTOS> <IP_OBJETIVO> -oN evidencias/nmap/versiones_servicios.txt
```

Ejemplo:

```bash
nmap -sV -sC -p 21,22,80,445 <IP_OBJETIVO> -oN evidencias/nmap/versiones_servicios.txt
```

## Paso 6.7 — Detección de sistema operativo

```bash
nmap -O <IP_OBJETIVO> -oN evidencias/nmap/sistema_operativo.txt
```

## Importante

Usa `-T3` o valores moderados. No uses opciones agresivas sin necesidad. Tu rol es reconocimiento y planificación, no romper nada.

---

# Fase 7 — Completar tabla de servicios

## Objetivo

Transformar las salidas técnicas en una tabla limpia para el informe y para el Rol 2.

Edita:

```text
anexos/tabla_servicios.md
```

Con este formato:

| Puerto | Protocolo | Servicio | Versión     | Estado  | Evidencia                               | Observaciones         |
| -----: | --------- | -------- | ----------- | ------- | --------------------------------------- | --------------------- |
|     22 | TCP       | SSH      | OpenSSH X.X | Abierto | evidencias/nmap/versiones_servicios.txt | Posible acceso remoto |
|     80 | TCP       | HTTP     | Apache X.X  | Abierto | evidencias/nmap/versiones_servicios.txt | Revisar con Nikto     |
|    445 | TCP       | SMB      | Samba X.X   | Abierto | evidencias/nmap/versiones_servicios.txt | Posible enumeración   |

Tu tabla debe ser objetiva. No pongas todavía “vulnerable” si no lo ha validado el Rol 2. Puedes poner “requiere análisis”.

---

# Fase 8 — Registrar comandos ejecutados

## Objetivo

Que todo sea reproducible.

El PAI exige entregar logs y evidencias para que las pruebas sean reproducibles. 

Cada comando que ejecutes debe ir en:

```text
anexos/comandos_ejecutados.md
```

Formato:

```text
Fecha/hora:
Responsable: Rol 1
Objetivo:
Comando:
Resultado esperado:
Resultado obtenido:
Evidencia asociada:
Observaciones:
```

Ejemplo:

```text
Fecha/hora: 2026-05-XX 18:30
Responsable: Rol 1
Objetivo: Identificar servicios y versiones expuestas en la máquina objetivo.
Comando: nmap -sV -sC -p 21,22,80 192.168.56.105 -oN evidencias/nmap/versiones_servicios.txt
Resultado esperado: Obtener versiones de los servicios activos.
Resultado obtenido: Se identifican servicios FTP, SSH y HTTP.
Evidencia asociada: evidencias/nmap/versiones_servicios.txt
Observaciones: Los servicios detectados se trasladan a tabla_servicios.md para análisis posterior.
```

---

# Fase 9 — Primer análisis MITRE de alto nivel

## Objetivo

No tienes que hacer el análisis profundo de explotación, pero sí preparar el marco para que el Rol 2 pueda mapear hallazgos.

Crea una tabla inicial en el informe:

| Servicio | Posible táctica MITRE              | Posible técnica                                    | Motivo                          |
| -------- | ---------------------------------- | -------------------------------------------------- | ------------------------------- |
| SSH      | Credential Access / Initial Access | Brute Force, si procede                            | Servicio de acceso remoto       |
| HTTP     | Initial Access                     | Exploit Public-Facing Application                  | Aplicación expuesta             |
| SMB      | Discovery / Lateral Movement       | Remote Services, si procede                        | Servicio de compartición remoto |
| FTP      | Initial Access                     | Exploit Public-Facing Application / Valid Accounts | Servicio remoto expuesto        |

No fuerces técnicas si no están justificadas. Deja algunas como “pendiente de validación por Rol 2”.

---

# Fase 10 — Entregar paquete al Rol 2

## Objetivo

Cuando acabes reconocimiento, debes dejarle al Rol 2 una base clara para analizar vulnerabilidades y explotar.

## Qué le tienes que pasar

```text
1. IP objetivo confirmada.
2. Tabla de servicios.
3. Salidas Nmap.
4. Notas sobre servicios interesantes.
5. Metodología y alcance.
6. Restricciones: qué se puede y no se puede probar.
7. Priorización inicial.
```

## Mensaje recomendado al Rol 2

```text
Te dejo completada la fase de planificación y reconocimiento. La máquina objetivo es [IP]. El enfoque definido es Black Box en red local autorizada. Los servicios identificados están en anexos/tabla_servicios.md y las evidencias en evidencias/nmap/. 

A partir de aquí, tu tarea es analizar vulnerabilidades por servicio, buscar CVE/CVSS/CWE, comprobar si existen exploits conocidos y validar de forma controlada los hallazgos dentro del alcance definido en scope.md. Por favor, registra todos los comandos y evidencias para que el Rol 3 pueda integrarlo en el informe.
```

---

# Fase 11 — Redactar tus secciones del informe

## Secciones que debes dejar prácticamente terminadas

En `informe/Informe_Tecnico_PAI5.md`, tú deberías completar:

```text
1. Resumen ejecutivo, primera versión
2. Alcance y autorización
3. Metodología
4. Entorno de trabajo
5. Planificación de la evaluación
6. Reconocimiento y fingerprinting
7. Identificación de servicios
8. Relación preliminar con MITRE ATT&CK
```

## Secciones donde solo dejas marcador

```text
Análisis de vulnerabilidades → Rol 2
Explotación controlada → Rol 2
Escalada de privilegios → Rol 2
Post-explotación → Rol 2 + Rol 3
Plan de mitigación → Rol 3
Conclusiones finales → Todos
Anexos finales → Rol 3
```

---

# Checklist final de tu rol

Antes de decir “mi parte está hecha”, comprueba esto:

```text
[ ] README.md revisado.
[ ] scope.md completado.
[ ] metodologia.md completado.
[ ] equipo.md revisado.
[ ] Máquina objetivo elegida y justificada.
[ ] Enfoque Black Box definido.
[ ] Red de laboratorio documentada.
[ ] IP atacante guardada.
[ ] IP objetivo guardada.
[ ] Versiones de herramientas guardadas.
[ ] Descubrimiento de red ejecutado.
[ ] Nmap puertos comunes ejecutado.
[ ] Nmap puertos completos ejecutado.
[ ] Nmap versiones ejecutado.
[ ] Nmap sistema operativo ejecutado, si procede.
[ ] Tabla de servicios completada.
[ ] Comandos registrados.
[ ] Evidencias guardadas en carpetas correctas.
[ ] Metodología NIST 800-115 redactada.
[ ] Uso de MITRE/CVE/CVSS/CWE/CISA KEV explicado.
[ ] Secciones iniciales del informe redactadas.
[ ] Material entregado al Rol 2.
```

---

# Orden real de trabajo recomendado

Yo lo haría exactamente en este orden:

```text
1. Revisar estructura generada por Codex.
2. Completar equipo.md.
3. Completar scope.md.
4. Elegir máquina objetivo.
5. Documentar entorno atacante.
6. Arrancar máquina objetivo.
7. Identificar IP atacante y objetivo.
8. Ejecutar reconocimiento Nmap.
9. Completar tabla de servicios.
10. Registrar todos los comandos.
11. Redactar metodología.
12. Redactar planificación.
13. Redactar reconocimiento.
14. Preparar entrega al Rol 2.
```

---

# Tu entregable interno como Rol 1

Cuando termines, deberías poder entregar al equipo esta carpeta/paquete:

```text
ROL1_PLANIFICACION_RECONOCIMIENTO/
├── README.md
├── scope.md
├── metodologia.md
├── equipo.md
├── evidencias/
│   ├── entorno/
│   ├── reconocimiento/
│   └── nmap/
├── anexos/
│   ├── comandos_ejecutados.md
│   └── tabla_servicios.md
└── informe/
    └── secciones_rol1_completadas.md
```

Realmente no hace falta separarlo así si está todo en el repo, pero mentalmente esa es tu responsabilidad.

Mi siguiente paso recomendado sería que me pases qué máquina objetivo vais a usar, o las opciones que estáis valorando, y te ayudo a elegir la mejor para que el PAI quede potente pero controlable.

