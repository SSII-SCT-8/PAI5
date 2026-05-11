# Informe Técnico PAI 5 - RedTeamPro

## Portada

- **Proyecto:** RedTeamPro
- **Asignatura:** Seguridad en Sistemas Informáticos e Internet
- **Tipo de evaluación:** Red Team / pentesting autorizado
- **Modalidad:** Black Box
- **Organización evaluada:** Ayuntamiento de Santa Marta
- **Sistema evaluado:** Servidor de servicios digitales municipales
- **Sistema objetivo de laboratorio:** Kioptrix Level 1
- **Entorno atacante:** Kali Linux en máquina virtual
- **Hipervisor:** Oracle VirtualBox
- **Red:** Host-only / red interna aislada
- **Equipo:** SCT-8
- **Responsable del Rol 1:** Juan Cardesa
- **Fecha:** 2026-05-11
- **Versión del documento:** 0.3

---

## Control de versiones

| Versión | Fecha | Responsable | Cambios |
|---|---|---|---|
| 0.1 | 2026-05-08 | Juan Cardesa | Plantilla inicial del informe |
| 0.2 | 2026-05-09 | Juan Cardesa | Adaptación al caso Ayuntamiento de Santa Marta / Kioptrix Level 1 |
| 0.3 | 2026-05-11 | Juan Cardesa | Actualización de alcance, entorno, reconocimiento, fingerprinting, servicios identificados y evidencias del Rol 1 |

---

## Resumen ejecutivo

Este informe documenta una evaluación académica de seguridad tipo **Red Team / pentesting autorizado** sobre una organización pública ficticia, el **Ayuntamiento de Santa Marta**. El sistema evaluado representa un servidor de servicios digitales municipales desplegado en un laboratorio controlado mediante la máquina vulnerable **Kioptrix Level 1**.

La evaluación se plantea con enfoque **Black Box**, por lo que el equipo actúa como un atacante externo autorizado, sin conocimiento interno previo del sistema objetivo. El entorno de pruebas se ha desplegado mediante **Oracle VirtualBox**, utilizando **Kali Linux** como máquina atacante y una red **Host-only** aislada para garantizar que no se afectan sistemas externos ni servicios reales.

Durante la fase inicial de planificación y reconocimiento se ha identificado el objetivo definitivo en la dirección `192.168.56.102`, dentro de la red de laboratorio `192.168.56.0/24`. El escaneo de puertos y versiones ha permitido acotar la superficie TCP expuesta a seis servicios principales: SSH, HTTP, rpcbind, NetBIOS/SMB, HTTPS y status/RPC.

Los resultados obtenidos en esta fase no constituyen todavía vulnerabilidades explotadas, sino una base técnica para que la fase posterior analice CVE, CVSS, CWE, CISA KEV, Exploit-DB, SearchSploit y posibles técnicas MITRE ATT&CK asociadas.

[PENDIENTE: completar con riesgo global, hallazgos confirmados y principales recomendaciones cuando finalicen las fases de análisis, explotación controlada y mitigación.]

---

## Alcance y autorización

La evaluación se limita exclusivamente a la máquina vulnerable **Kioptrix Level 1**, desplegada dentro de una red local aislada. El equipo actuará como atacante externo autorizado, sin información interna previa del sistema objetivo.

El laboratorio se ha configurado para trabajar únicamente sobre activos propios y controlados. No se evaluará ningún ayuntamiento real, dominio público, dirección IP externa, infraestructura universitaria real ni servicio de terceros.

### Dentro del alcance

- Reconocimiento de red local.
- Identificación de la IP objetivo.
- Fingerprinting del sistema objetivo.
- Escaneo de puertos TCP.
- Detección de servicios y versiones.
- Detección aproximada del sistema operativo.
- Análisis de vulnerabilidades.
- Búsqueda de CVE, NVD, CVSS y CWE.
- Consulta de CISA KEV, Exploit-DB y SearchSploit.
- Relación de hallazgos con MITRE ATT&CK cuando proceda.
- Escaneo web básico si procede.
- Explotación controlada únicamente dentro del laboratorio.
- Escalada de privilegios controlada, si procede.
- Post-explotación limitada a evidenciar impacto técnico.
- Registro de evidencias, logs y capturas.
- Redacción de informe técnico y plan de mitigación.

### Fuera del alcance

- Sistemas externos.
- Direcciones IP públicas.
- Servicios reales de terceros.
- Dominios de Internet.
- Ataques de denegación de servicio.
- Malware.
- Persistencia maliciosa.
- Evasión de defensas.
- Técnicas destructivas.
- Exfiltración real de información sensible.
- Modificación innecesaria de datos.
- Movimiento lateral fuera de Kioptrix Level 1.
- Ataques contra la máquina anfitriona Windows.
- Ataques contra otros equipos conectados a la red física del usuario.

### Entorno autorizado confirmado

| Elemento | Valor |
|---|---|
| Hipervisor | Oracle VirtualBox |
| Máquina atacante | Kali Linux |
| IP atacante NAT | `10.0.2.15/24` |
| IP atacante Host-only | `192.168.56.101/24` |
| Interfaz de laboratorio | `eth1` |
| Máquina objetivo | Kioptrix Level 1 |
| IP objetivo definitiva | `192.168.56.102` |
| MAC objetivo | `08:00:27:D0:82:25` |
| Red de laboratorio | `192.168.56.0/24` |
| Tipo de red | Host-only / red interna aislada |
| Modalidad | Black Box |

---

## Organización evaluada

El **Ayuntamiento de Santa Marta** es una organización pública ficticia creada exclusivamente para contextualizar el ejercicio académico. El activo evaluado se presenta como un servidor de servicios digitales municipales, potencialmente empleado para prestar servicios web, acceso remoto o servicios auxiliares vinculados a la administración digital.

Esta contextualización permite interpretar los resultados técnicos en términos de impacto sobre una organización pública: disponibilidad de servicios digitales, confidencialidad de información, integridad de sistemas y riesgo reputacional.

No existe relación con una entidad real ni se evalúa infraestructura pública real.

---

## Sistema objetivo

| Elemento | Valor |
|---|---|
| Sistema objetivo | Kioptrix Level 1 |
| Fuente | VulnHub / Kioptrix |
| Representación en el caso | Servidor de servicios digitales municipales |
| IP definitiva | `192.168.56.102` |
| MAC | `08:00:27:D0:82:25` |
| Sistema operativo estimado | Linux 2.4.X |
| Detalle estimado por Nmap | Linux 2.4.9 - 2.4.18 |
| Distancia de red | 1 salto |
| Motivo de elección | Permite un ciclo completo de reconocimiento, análisis, explotación controlada, posible escalada y reporting |
| Diferencia con caso de estudio | Se selecciona Kioptrix Level 1 en lugar de Metasploitable3 |

Se ha seleccionado **Kioptrix Level 1** por tratarse de una máquina vulnerable de laboratorio diseñada para prácticas de evaluación de seguridad. Su uso permite desarrollar un ciclo completo de evaluación en un entorno controlado, reproducible y diferente al sistema utilizado en el caso de estudio, donde se emplea Metasploitable3.

Durante la fase inicial de descubrimiento se detectó `192.168.56.100` como primer candidato a objetivo. Sin embargo, los resultados de escaneo no fueron coherentes con Kioptrix Level 1. Tras revisar la configuración de red de VirtualBox y repetir el descubrimiento, se identificó `192.168.56.102` como sistema objetivo definitivo.

---

## Metodología

La metodología principal empleada es **NIST SP 800-115**, estructurada en tres grandes bloques:

1. **Planificación**
2. **Ejecución**
3. **Post-ejecución / reporting**

En el contexto del PAI 5, esta metodología se concreta en las siguientes fases:

1. Planificación.
2. Reconocimiento / fingerprinting.
3. Identificación de servicios.
4. Análisis de vulnerabilidades.
5. Explotación controlada.
6. Escalada de privilegios.
7. Post-explotación.
8. Reporting.
9. Plan de mitigación.

Durante la fase de planificación se define el alcance, la organización ficticia, el sistema objetivo, la red de laboratorio, los roles del equipo y las restricciones legales y técnicas. Durante la fase de ejecución se realizan tareas de descubrimiento, fingerprinting, identificación de servicios, análisis de vulnerabilidades y validación controlada de hallazgos. Finalmente, en la fase de post-ejecución se documentan resultados, evidencias, riesgos, impacto y recomendaciones.

### Uso de MITRE ATT&CK

MITRE ATT&CK se utilizará para relacionar hallazgos con tácticas y técnicas reales de adversarios. Esta relación se realizará únicamente cuando exista una justificación técnica basada en evidencias reales.

### Uso de CVE, NVD, CVSS y CWE

Las vulnerabilidades identificadas se documentarán, cuando proceda, mediante:

- **CVE**, como identificador público de vulnerabilidad.
- **NVD**, como fuente técnica de referencia.
- **CVSS**, como estimación de severidad técnica.
- **CWE**, como clasificación de la debilidad subyacente.

### Uso de CISA KEV

CISA KEV se utilizará como fuente de priorización adicional cuando una vulnerabilidad detectada esté catalogada como explotada activamente en el mundo real.

---

## Entorno de trabajo

La evaluación se ha realizado sobre un laboratorio local virtualizado mediante **Oracle VirtualBox**, compuesto por una máquina atacante **Kali Linux** y una máquina objetivo **Kioptrix Level 1**. Ambas máquinas se han configurado dentro de una red **Host-only**, permitiendo la comunicación entre atacante y objetivo sin exposición directa a sistemas externos.

La máquina atacante dispone también de una interfaz NAT para conectividad propia, pero las pruebas sobre el sistema objetivo se realizan exclusivamente a través de la interfaz Host-only del laboratorio.

| Elemento | Valor |
|---|---|
| Hipervisor | Oracle VirtualBox |
| Máquina atacante | Kali Linux en máquina virtual |
| Sistema atacante | Kali GNU/Linux Rolling |
| Kernel atacante | Linux 6.18.12+kali-amd64 |
| Arquitectura atacante | x86_64 |
| IP NAT atacante | `10.0.2.15/24` |
| IP Host-only atacante | `192.168.56.101/24` |
| Interfaz Host-only | `eth1` |
| Máquina objetivo | Kioptrix Level 1 |
| IP objetivo | `192.168.56.102` |
| MAC objetivo | `08:00:27:D0:82:25` |
| Rango de laboratorio | `192.168.56.0/24` |
| Tipo de red | Host-only / red interna aislada |
| Herramientas de reconocimiento | `ip`, `ping`, `arp`, `nmap` |
| Herramientas de fingerprinting | `nmap -O`, `nmap -sV`, `nmap -sC` |
| Herramientas de análisis previstas | SearchSploit, Exploit-DB, NVD/CVE, Nikto si procede |
| Herramientas de explotación controlada previstas | Metasploit o PoC controladas si procede |
| Herramientas de escalada previstas | LinPEAS si procede |

Las evidencias del entorno se almacenan en `evidencias/entorno/`, mientras que las evidencias de reconocimiento y Nmap se conservan en `evidencias/reconocimiento/` y `evidencias/nmap/`.

---

## Planificación de la evaluación

Durante la fase de planificación se han definido los siguientes elementos:

- Organización ficticia evaluada: Ayuntamiento de Santa Marta.
- Sistema simulado: servidor de servicios digitales municipales.
- Sistema objetivo de laboratorio: Kioptrix Level 1.
- Entorno atacante: Kali Linux.
- Hipervisor: Oracle VirtualBox.
- Tipo de red: Host-only / red interna aislada.
- Modalidad: Black Box.
- Responsable de planificación y reconocimiento: Juan Cardesa.
- Evidencias a conservar: salidas de comandos, logs, capturas y tablas técnicas.

La decisión de utilizar Kioptrix Level 1 se justifica porque permite desarrollar el ciclo completo de evaluación en un entorno preparado para prácticas de seguridad. Además, cumple la condición de seleccionar un objetivo distinto al utilizado como ejemplo en el caso de estudio, donde se emplea Metasploitable3.

[PENDIENTE: completar calendario final e integrantes reales del equipo.]

---

## Reconocimiento y fingerprinting

La fase de reconocimiento tuvo como objetivo identificar los hosts activos en la red de laboratorio, determinar la IP definitiva del sistema objetivo, comprobar conectividad, descubrir puertos abiertos y obtener información inicial sobre servicios, versiones y sistema operativo.

### Descubrimiento de red

El segmento Host-only utilizado fue:

```text
192.168.56.0/24