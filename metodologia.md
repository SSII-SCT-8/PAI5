# Metodología

La evaluación seguirá como referencia principal **NIST SP 800-115, Technical Guide to Information Security Testing and Assessment**, adaptada a un ejercicio académico de tipo **Red Team / pentesting autorizado** sobre una organización pública ficticia: el **Ayuntamiento de Santa Marta**.

El entorno de trabajo se ha desplegado en un laboratorio local y controlado, utilizando **Kali Linux** como máquina atacante y **Kioptrix Level 1** como sistema objetivo dentro de una red **Host-only / interna aislada**. El enfoque de la prueba será **Black Box**, por lo que el equipo actuará como un atacante externo autorizado sin conocimiento interno previo del sistema objetivo.

No se ejecutará explotación durante la fase de planificación y reconocimiento. Las fases de análisis de vulnerabilidades, explotación controlada, escalada y post-explotación se realizarán posteriormente, únicamente dentro del alcance autorizado.

---

## Datos metodológicos del laboratorio

| Elemento | Valor |
|---|---|
| Metodología principal | NIST SP 800-115 |
| Tipo de evaluación | Red Team / pentesting autorizado |
| Modalidad | Black Box |
| Organización ficticia | Ayuntamiento de Santa Marta |
| Sistema simulado | Servidor de servicios digitales municipales |
| Máquina atacante | Kali Linux |
| IP atacante Host-only | `192.168.56.101/24` |
| Máquina objetivo | Kioptrix Level 1 |
| IP objetivo definitiva | `192.168.56.102` |
| Red de laboratorio | `192.168.56.0/24` |
| Tipo de red | Host-only / red interna aislada |
| Responsable de planificación y reconocimiento | Juan Cardesa |

---

## Fases del proyecto

| Fase | Objetivo | Salida esperada |
|---|---|---|
| Planificación | Definir alcance, autorización, roles, entorno, límites y sistema objetivo | `scope.md`, `equipo.md`, estructura de evidencias |
| Reconocimiento / fingerprinting | Identificar host, puertos, servicios, versiones y sistema operativo estimado | Evidencias en `evidencias/reconocimiento/` y `evidencias/nmap/` |
| Identificación de servicios | Transformar salidas técnicas en una tabla clara y trazable | `anexos/tabla_servicios.md` |
| Análisis de vulnerabilidades | Relacionar servicios y versiones con vulnerabilidades públicas documentadas | `anexos/tabla_hallazgos.md` y evidencias |
| Explotación controlada | Validar impacto de forma limitada y autorizada | Evidencias en `evidencias/explotacion/` |
| Escalada de privilegios | Evaluar ampliación de privilegios si procede | Evidencias reproducibles y limitadas |
| Post-explotación | Evidenciar impacto sin persistencia ni exfiltración real | Capturas y logs controlados |
| Reporting | Consolidar resultados, riesgos, evidencias y conclusiones | Informe técnico y anexos |
| Plan de mitigación | Proponer medidas correctivas priorizadas | Matriz de riesgos y recomendaciones |

---

## Herramientas previstas por fase

| Fase | Herramientas |
|---|---|
| Reconocimiento | `ip`, `ping`, `arp`, `nmap` |
| Fingerprinting | `nmap -O`, `nmap -sV`, `nmap -sC` |
| Análisis de vulnerabilidades | SearchSploit, Exploit-DB, NVD/CVE, CISA KEV, Nikto si procede |
| Explotación controlada | Metasploit si procede, PoC controladas si procede |
| Escalada de privilegios | LinPEAS si procede |
| Documentación | Markdown, logs de comandos, capturas, tablas de servicios y hallazgos |

El uso de herramientas se registrará en `anexos/comandos_ejecutados.md` y cada evidencia se guardará en la carpeta correspondiente, respetando la estructura del proyecto.

---

## 1. Planificación

### Objetivo

Cerrar el escenario de evaluación, definir el activo objetivo, establecer el entorno técnico, repartir responsabilidades y fijar las pruebas permitidas y prohibidas.

### Actividades realizadas

- Definición de la organización ficticia: **Ayuntamiento de Santa Marta**.
- Definición del sistema simulado: **servidor de servicios digitales municipales**.
- Selección de la modalidad de prueba: **Black Box**.
- Selección de la máquina atacante: **Kali Linux**.
- Selección del sistema objetivo: **Kioptrix Level 1**.
- Justificación de la elección del objetivo frente al ejemplo del caso de estudio.
- Despliegue del laboratorio en **Oracle VirtualBox**.
- Configuración de red **Host-only / interna aislada**.
- Definición de alcance permitido y fuera de alcance.
- Preparación de estructura de evidencias, anexos e informe.

### Resultado

La planificación queda reflejada principalmente en:

- `scope.md`
- `equipo.md`
- `informe/Informe_Tecnico_PAI5.md`
- `anexos/comandos_ejecutados.md`
- `anexos/tabla_servicios.md`

---

## 2. Reconocimiento / fingerprinting

### Objetivo

Identificar de forma no destructiva la superficie expuesta por Kioptrix Level 1 dentro de la red local aislada.

### Actividades realizadas

- Identificación de interfaces de red en Kali Linux.
- Identificación del rango de laboratorio: `192.168.56.0/24`.
- Descubrimiento de hosts activos mediante Nmap.
- Corrección de la identificación inicial del objetivo.
- Confirmación de la IP definitiva de Kioptrix Level 1: `192.168.56.102`.
- Validación de conectividad mediante `ping`.
- Escaneo inicial de puertos TCP.
- Detección de versiones de servicios.
- Fingerprinting activo de sistema operativo.
- Escaneo completo de puertos TCP.

### Comandos principales utilizados

| Comando | Finalidad |
|---|---|
| `ip a` | Identificar interfaces e IPs de Kali Linux |
| `ip route` | Identificar rutas y rango de red del laboratorio |
| `nmap -sn 192.168.56.0/24` | Descubrir hosts activos en la red Host-only |
| `ping -c 4 192.168.56.102` | Validar conectividad con Kioptrix Level 1 |
| `sudo nmap -sS -T3 192.168.56.102 -oN evidencias/nmap/puertos_comunes.txt` | Identificar puertos TCP abiertos iniciales |
| `sudo nmap -sV -sC -T3 -p 22,80,111,139,443,32768 192.168.56.102 -oN evidencias/nmap/versiones_servicios.txt` | Detectar versiones y ejecutar scripts básicos de Nmap |
| `sudo nmap -O 192.168.56.102 -oN evidencias/nmap/sistema_operativo.txt` | Estimar sistema operativo |
| `sudo nmap -p- -T3 192.168.56.102 -oN evidencias/nmap/puertos_completos.txt` | Confirmar superficie TCP completa |

### Resultado

El reconocimiento permitió identificar como objetivo definitivo la máquina `192.168.56.102`, correspondiente a Kioptrix Level 1.

El escaneo inicial y el escaneo completo confirmaron que la superficie TCP expuesta está limitada a los siguientes puertos:

| Puerto | Servicio |
|---:|---|
| 22/tcp | SSH |
| 80/tcp | HTTP |
| 111/tcp | rpcbind |
| 139/tcp | NetBIOS/SMB |
| 443/tcp | HTTPS |
| 32768/tcp | status/RPC |

El fingerprinting de sistema operativo estimó que el objetivo ejecuta **Linux 2.4.X**, concretamente una versión probable entre **Linux 2.4.9 y Linux 2.4.18**.

---

## 3. Identificación de servicios

### Objetivo

Convertir los resultados de Nmap y otras herramientas en una tabla objetiva de servicios, versiones, evidencias y observaciones.

### Criterio aplicado

La tabla de servicios no marca ningún servicio como vulnerable sin validación posterior. Se documentan únicamente servicios observados en evidencias reales, junto con indicios técnicos que requieren análisis posterior.

### Servicios identificados

| Puerto | Servicio | Versión / información detectada |
|---:|---|---|
| 22/tcp | SSH | OpenSSH 2.9p2, protocolo 1.99, soporte SSHv1 |
| 80/tcp | HTTP | Apache httpd 1.3.20 sobre Unix/Red Hat Linux, mod_ssl/2.8.4, OpenSSL/0.9.6b |
| 111/tcp | rpcbind | rpcbind v2, RPC #100000 |
| 139/tcp | NetBIOS/SMB | Samba smbd, workgroup MYGROUP |
| 443/tcp | HTTPS | Apache/1.3.20, mod_ssl/2.8.4, OpenSSL/0.9.6b, SSLv2 soportado |
| 32768/tcp | status/RPC | status v1, RPC #100024 |

La tabla completa se encuentra en:

`anexos/tabla_servicios.md`

---

## 4. Análisis de vulnerabilidades

### Objetivo

Relacionar los servicios y versiones detectadas con vulnerabilidades públicas verificables, priorizando aquellas con mayor probabilidad de explotación e impacto.

### Fuentes previstas

- **CVE**, para identificadores públicos de vulnerabilidades.
- **NVD**, para descripción técnica, referencias y puntuación CVSS.
- **CVSS**, para severidad técnica.
- **CWE**, para clasificación de debilidades.
- **CISA KEV**, para priorizar vulnerabilidades explotadas en el mundo real.
- **Exploit-DB**, para referencias técnicas y posibles pruebas de concepto.
- **SearchSploit**, para búsqueda local de exploits conocidos.
- **Nikto**, si procede, para análisis básico del servicio web.

### Criterio de validación

No se confirmará ninguna vulnerabilidad únicamente por coincidencia de versión. Para que un hallazgo sea tratado como vulnerabilidad candidata o confirmada deberá existir una justificación técnica basada en:

- Servicio afectado.
- Versión observada.
- Evidencia de laboratorio.
- Referencia pública verificable.
- Condiciones de explotación razonables.
- Impacto potencial.
- Posibilidad de validación controlada.

**Estado:** pendiente de completar por Rol 2 con hallazgos reales.

---

## 5. Explotación controlada

### Objetivo

Validar impacto técnico dentro del laboratorio autorizado, solo cuando el equipo alcance esa fase y únicamente sobre hallazgos previamente justificados.

### Condiciones

- Solo contra **Kioptrix Level 1**.
- Solo dentro de la red **Host-only / interna aislada**.
- Sin denegación de servicio.
- Sin malware.
- Sin persistencia.
- Sin evasión.
- Sin exfiltración real de información sensible.
- Sin acciones destructivas.
- Cada prueba debe tener comando, objetivo, resultado esperado, resultado obtenido y evidencia.

**Estado:** pendiente de completar solo si se ejecutan pruebas reales autorizadas.

---

## 6. Escalada de privilegios

### Objetivo

Comprobar si un acceso obtenido permite elevar privilegios dentro del sistema objetivo, de forma limitada y documentada.

Herramientas como **LinPEAS** podrán usarse si procede y si su ejecución está dentro del alcance. La finalidad será documentar impacto técnico, no mantener acceso ni modificar innecesariamente el sistema.

Toda prueba de escalada deberá registrarse en:

`anexos/comandos_ejecutados.md`

y acompañarse de evidencias en:

`evidencias/post-explotacion/`

o en la carpeta correspondiente que defina el equipo.

**Estado:** pendiente de completar si aplica.

---

## 7. Post-explotación

### Objetivo

Documentar impacto potencial sin exfiltración real, persistencia ni modificación innecesaria del sistema.

### Actividades permitidas

- Verificación mínima de usuario y privilegios.
- Identificación controlada del alcance del acceso obtenido.
- Captura de evidencias no sensibles.
- Registro de estado.
- Limpieza si procede.

### Actividades no permitidas

- Mantener acceso.
- Crear usuarios persistentes.
- Instalar malware.
- Exfiltrar información real.
- Borrar o alterar datos innecesariamente.
- Pivotar a otros sistemas.

**Estado:** pendiente de completar si aplica.

---

## 8. Reporting y plan de mitigación

### Objetivo

Consolidar resultados reales, evidencias, riesgo e indicaciones de mitigación en un informe técnico completo.

El informe debe incluir:

- Alcance y autorización.
- Metodología aplicada.
- Entorno de trabajo.
- Evidencias de reconocimiento.
- Servicios identificados.
- Hallazgos confirmados.
- Relación con CVE/CVSS/CWE.
- Relación con MITRE ATT&CK.
- Evaluación del riesgo.
- Plan de mitigación priorizado.
- Limitaciones.
- Conclusiones.
- Anexos.

Las mitigaciones deberán estar asociadas a hallazgos concretos y priorizadas en función de severidad, explotabilidad e impacto.

---

## Uso de MITRE ATT&CK

MITRE ATT&CK se usará para contextualizar hallazgos dentro de tácticas y técnicas reales de adversarios.

El mapeo se hará solo cuando exista justificación basada en evidencias, por ejemplo:

- Servicios expuestos.
- Vulnerabilidades confirmadas.
- Acciones reproducidas en laboratorio.
- Técnicas observables durante explotación controlada.
- Impacto demostrado.

### Relación preliminar basada en servicios detectados

| Servicio | Posible táctica MITRE ATT&CK | Posible técnica | Estado |
|---|---|---|---|
| SSH | Initial Access / Credential Access | Valid Accounts / Brute Force, si procede | Pendiente de validación |
| HTTP/HTTPS | Initial Access | Exploit Public-Facing Application, si procede | Pendiente de validación |
| SMB/NetBIOS | Discovery / Lateral Movement | Remote Services, si procede | Pendiente de validación |
| rpcbind/status RPC | Discovery | Network Service Discovery, si procede | Pendiente de validación |

No se afirmará explotación ni técnica ATT&CK definitiva sin evidencia posterior.

---

## Criterios de priorización de hallazgos

La prioridad de los hallazgos se asignará combinando:

- Severidad CVSS.
- Probabilidad definida en `anexos/matriz_riesgos.md`.
- Impacto definido en `anexos/matriz_riesgos.md`.
- Exposición del servicio afectado.
- Existencia de CVE público.
- Presencia en CISA KEV.
- Disponibilidad de exploit o PoC en Exploit-DB/SearchSploit.
- Facilidad de reproducción en laboratorio.
- Impacto sobre confidencialidad, integridad y disponibilidad.
- Viabilidad de mitigación.
- Complejidad de corrección.

### Escala de prioridad

| Prioridad | Criterio general |
|---|---|
| Crítica | Vulnerabilidad explotable con impacto alto o crítico, especialmente si existe PoC pública o aparece en CISA KEV |
| Alta | Vulnerabilidad con impacto relevante y explotación razonablemente viable |
| Media | Debilidad explotable bajo condiciones concretas o con impacto moderado |
| Baja | Configuración mejorable o debilidad de bajo impacto directo |
| Informativa | Observación útil para hardening, sin impacto directo confirmado |

**Estado:** pendiente de aplicar criterios a hallazgos reales.

---

## Gestión de evidencias

Toda evidencia generada deberá almacenarse en la carpeta correspondiente:

| Tipo de evidencia | Ruta |
|---|---|
| Entorno | `evidencias/entorno/` |
| Reconocimiento | `evidencias/reconocimiento/` |
| Escaneos Nmap | `evidencias/nmap/` |
| Análisis web | `evidencias/nikto/` |
| Búsqueda de exploits | `evidencias/searchsploit/` |
| Vulnerabilidades | `evidencias/vulnerabilidades/` |
| Explotación controlada | `evidencias/explotacion/` |
| Post-explotación | `evidencias/post-explotacion/` |
| Capturas | `evidencias/capturas/` |
| Logs generales | `evidencias/logs/` |

### Reglas de evidencia

- No modificar evidencias originales.
- Usar rutas relativas al proyecto.
- Registrar cada comando relevante.
- No inventar resultados.
- Mantener relación clara entre hallazgo y evidencia.
- Conservar también resultados inesperados si aportan información técnica.
- Separar evidencia de reconocimiento, vulnerabilidad, explotación y mitigación.

---

## Limitaciones metodológicas

- El entorno es académico y de laboratorio.
- Kioptrix Level 1 no representa una infraestructura pública real.
- El objetivo se encuentra en una red Host-only aislada.
- La identificación del sistema operativo mediante Nmap es una estimación técnica.
- Los servicios detectados no se consideran vulnerables hasta que sean analizados y validados.
- La explotación controlada queda fuera de la fase de planificación y reconocimiento.
- Las conclusiones finales deberán basarse únicamente en resultados reales.

---

## Estado actual de la metodología

| Fase | Estado |
|---|---|
| Planificación | Completada por Juan Cardesa |
| Reconocimiento / fingerprinting | Completada por Juan Cardesa |
| Identificación de servicios | Completada por Juan Cardesa |
| Análisis de vulnerabilidades | Pendiente de Rol 2 |
| Explotación controlada | Pendiente de Rol 2 |
| Escalada de privilegios | Pendiente de Rol 2, si procede |
| Post-explotación | Pendiente de Rol 2/Rol 3, si procede |
| Reporting final | Pendiente de consolidación |
| Plan de mitigación | Pendiente de Rol 3 |