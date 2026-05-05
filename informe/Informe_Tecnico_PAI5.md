# Informe Tecnico PAI5 - RedTeamPro

## Portada

- Proyecto: RedTeamPro
- Asignatura: Seguridad en Sistemas Informaticos e Internet
- Tipo de evaluacion: Red Team / pentesting autorizado
- Modalidad: Black Box
- Organizacion evaluada: Ayuntamiento de Santa Marta
- Sistema evaluado: Servidor de servicios digitales municipales
- Sistema objetivo de laboratorio: Kioptrix Level 1
- Entorno atacante: Kali Linux en maquina virtual
- Red: Host-only / red interna aislada
- Equipo: [PENDIENTE: completar]
- Fecha: [PENDIENTE: completar]
- Version del documento: 0.2

## Control de versiones

| Version | Fecha | Responsable | Cambios |
|---|---|---|---|
| 0.1 | [PENDIENTE] | [PENDIENTE] | Plantilla inicial |
| 0.2 | [PENDIENTE] | [PENDIENTE] | Adaptacion al caso Ayuntamiento de Santa Marta / Kioptrix Level 1 |

## Resumen ejecutivo

Este informe documenta una evaluacion academica Red Team / pentesting autorizado sobre una organizacion publica ficticia, el Ayuntamiento de Santa Marta. El sistema evaluado representa un servidor de servicios digitales municipales desplegado en laboratorio mediante Kioptrix Level 1.

La evaluacion se plantea con enfoque Black Box, usando Kali Linux como maquina atacante y una red host-only / interna aislada para garantizar que no se afectan sistemas externos.

[PENDIENTE: completar con resultados reales, riesgo global y principales recomendaciones cuando finalicen las pruebas.]

## Alcance y autorizacion

La evaluacion se limita a Kioptrix Level 1 dentro de una red local aislada. El equipo actuara como atacante externo autorizado, sin informacion interna previa del sistema objetivo.

Dentro del alcance:

- Reconocimiento de red local.
- Fingerprinting.
- Escaneo de puertos.
- Deteccion de servicios y versiones.
- Analisis de vulnerabilidades.
- Relacion con CVE, NVD, CVSS, CWE, CISA KEV y MITRE ATT&CK.
- Explotacion controlada y escalada solo si procede y dentro del laboratorio.
- Registro de evidencias, logs y capturas.

Fuera del alcance:

- Sistemas externos, IP publicas y servicios reales de terceros.
- DoS, malware, persistencia, evasion y tecnicas destructivas.
- Exfiltracion real de informacion sensible.
- Modificacion innecesaria de datos.

[PENDIENTE: completar IP atacante, IP objetivo, rango de red y declaracion de autorizacion.]

## Organizacion evaluada

El Ayuntamiento de Santa Marta es una organizacion publica ficticia creada para contextualizar el ejercicio. El activo evaluado se presenta como un servidor de servicios digitales municipales.

No existe relacion con una entidad real ni se evaluara infraestructura publica real.

## Sistema objetivo

| Elemento | Valor |
|---|---|
| Sistema objetivo | Kioptrix Level 1 |
| Fuente | VulnHub / Kioptrix |
| Representacion en el caso | Servidor de servicios digitales municipales |
| Motivo de eleccion | Permite un ciclo completo de reconocimiento, analisis, explotacion controlada, posible escalada y reporting |
| Diferencia con caso de estudio | Se selecciona Kioptrix Level 1 en lugar de Metasploitable3 |

[PENDIENTE: completar detalles tecnicos observados tras reconocimiento.]

## Metodologia

La metodologia principal sera NIST SP 800-115, estructurada en planificacion, ejecucion y post-ejecucion/reporting.

Fases aplicadas:

1. Planificacion.
2. Reconocimiento / fingerprinting.
3. Identificacion de servicios.
4. Analisis de vulnerabilidades.
5. Explotacion controlada.
6. Escalada de privilegios.
7. Post-explotacion.
8. Reporting.
9. Plan de mitigacion.

MITRE ATT&CK se usara para relacionar hallazgos con tacticas y tecnicas reales de adversarios. CVE, NVD, CVSS y CWE se usaran para identificar, clasificar y puntuar vulnerabilidades. CISA KEV se usara para priorizar vulnerabilidades explotadas en el mundo real cuando proceda.

## Entorno de trabajo

| Elemento | Valor |
|---|---|
| Maquina atacante | Kali Linux en maquina virtual |
| IP atacante | [PENDIENTE: completar con resultado real] |
| Maquina objetivo | Kioptrix Level 1 |
| IP objetivo | [PENDIENTE: completar con resultado real] |
| Tipo de red | Host-only / red interna aislada |
| Herramientas de reconocimiento | `ip`, `ping`, `nmap` |
| Herramientas de fingerprinting | `nmap -O`, `nmap -sV`, `nmap -sC` |
| Herramientas de analisis | SearchSploit, Exploit-DB, NVD/CVE, Nikto si hay servicio web |
| Herramientas de explotacion controlada | Metasploit o PoC controladas si procede |
| Herramientas de escalada | LinPEAS si procede |

[PENDIENTE: completar versiones reales de herramientas y evidencias en `evidencias/entorno/`.]

## Planificacion de la evaluacion

Durante la fase de planificacion se define el alcance, la organizacion ficticia, el objetivo de laboratorio, la red aislada, los roles del equipo y las restricciones tecnicas y eticas.

El uso de Kioptrix Level 1 se justifica porque permite documentar el ciclo completo de evaluacion en un entorno controlado y diferente a Metasploitable3, usado como referencia en el caso de estudio.

[PENDIENTE: completar calendario, integrantes reales y autorizacion.]

## Reconocimiento y fingerprinting

El reconocimiento tendra como finalidad identificar la IP del objetivo, comprobar disponibilidad, descubrir puertos y obtener informacion de servicios y versiones.

Evidencias previstas:

- `evidencias/entorno/`
- `evidencias/reconocimiento/`
- `evidencias/nmap/`
- `evidencias/nikto/` si existe servicio web.

Comandos previstos:

- `ip`
- `ping`
- `nmap -sn`
- `nmap --top-ports`
- `nmap -sV`
- `nmap -O`

[PENDIENTE: completar con resultados reales.]

## Identificacion de servicios

Los servicios detectados se documentaran en `anexos/tabla_servicios.md`, indicando puerto, protocolo, servicio, version, estado, evidencia y observaciones.

No se indicara que un servicio es vulnerable sin analisis y evidencia posterior.

[PENDIENTE: completar con servicios reales identificados.]

## Analisis de vulnerabilidades

El analisis de vulnerabilidades se realizara a partir de servicios y versiones reales observadas. Se consultaran SearchSploit, Exploit-DB, NVD/CVE, CVSS, CWE y CISA KEV.

Los hallazgos candidatos o confirmados se documentaran en `anexos/tabla_hallazgos.md`.

[PENDIENTE: completar con hallazgos reales.]

## Relacion con CVE/CVSS/CWE

Cada hallazgo confirmado se relacionara con:

- CVE, si existe identificador publico aplicable.
- CVSS, como referencia de severidad tecnica.
- CWE, como clasificacion de la debilidad subyacente.
- NVD, como fuente tecnica de apoyo.

[PENDIENTE: completar por hallazgo real.]

## Relacion con MITRE ATT&CK

MITRE ATT&CK se usara para mapear tacticas y tecnicas solo cuando exista una relacion justificable con la evidencia observada.

Tabla preliminar de referencia:

| Servicio | Posible tactica MITRE | Posible tecnica | Motivo | Estado |
|---|---|---|---|---|
| SSH | Credential Access / Initial Access | Brute Force / Valid Accounts, si procede | Servicio de acceso remoto | Pendiente de validacion |
| HTTP | Initial Access | Exploit Public-Facing Application, si procede | Aplicacion o servicio web expuesto | Pendiente de validacion |
| SMB | Discovery / Lateral Movement | Remote Services, si procede | Servicio de comparticion remoto | Pendiente de validacion |
| FTP | Initial Access | Exploit Public-Facing Application / Valid Accounts, si procede | Servicio remoto expuesto | Pendiente de validacion |

[PENDIENTE: ajustar la tabla a servicios reales.]

## Explotacion controlada

La explotacion controlada, si procede, se realizara unicamente contra Kioptrix Level 1 dentro de la red host-only / interna aislada.

Restricciones:

- No DoS.
- No malware.
- No persistencia.
- No evasion.
- No exfiltracion real.
- No acciones destructivas.

[PENDIENTE: completar solo con pruebas reales autorizadas.]

## Escalada de privilegios

La escalada de privilegios se evaluara solo si se obtiene acceso dentro de una prueba controlada y autorizada. Cualquier uso de herramientas como LinPEAS debera registrarse y justificarse.

[PENDIENTE: completar si aplica.]

## Post-explotacion

La post-explotacion se limitara a evidenciar impacto tecnico minimo, sin mantener acceso, sin exfiltrar informacion sensible y sin modificar datos innecesariamente.

[PENDIENTE: completar si aplica.]

## Evaluacion global del riesgo

El riesgo global se estimara combinando probabilidad, impacto, CVSS, exposicion, explotabilidad y prioridad de correccion. La matriz de referencia esta en `anexos/matriz_riesgos.md`.

[PENDIENTE: completar con resultados reales.]

## Plan de mitigacion

Las mitigaciones se redactaran por hallazgo confirmado e incluiran prioridad, accion recomendada y justificacion tecnica.

[PENDIENTE: completar con mitigaciones reales.]

## Conclusiones

[PENDIENTE: completar con conclusiones finales basadas exclusivamente en resultados reales.]

## Anexos

- `anexos/comandos_ejecutados.md`
- `anexos/tabla_servicios.md`
- `anexos/tabla_hallazgos.md`
- `anexos/matriz_riesgos.md`
- Evidencias en `evidencias/`
- Capturas en `evidencias/capturas/`

[PENDIENTE: verificar anexos antes de la entrega.]
