# Alcance de la Evaluacion

## Security Team

- Proyecto: PAI 5 - RedTeamPro
- Asignatura: Seguridad en Sistemas Informaticos e Internet
- Equipo: [PENDIENTE: completar nombre del equipo]
- Fecha de inicio: [PENDIENTE: completar]
- Fecha de fin: [PENDIENTE: completar]

## Contexto de la organizacion evaluada

La organizacion evaluada sera el Ayuntamiento de Santa Marta, una entidad publica ficticia utilizada exclusivamente para contextualizar el ejercicio academico. El activo evaluado representa un servidor de servicios digitales municipales expuesto dentro de una red local de laboratorio.

No se evaluara ningun ayuntamiento real, dominio publico, direccion IP externa ni servicio de terceros.

## Tipo de prueba

- Modalidad: Black Box.
- Justificacion: el equipo actuara como un atacante externo autorizado, sin conocimiento interno previo del sistema objetivo. La informacion inicial se limitara a la existencia del activo dentro de una red de laboratorio controlada.
- Objetivo tecnico: identificar superficie expuesta, servicios, versiones, vulnerabilidades potenciales y riesgo asociado, sin inventar resultados.

## Entorno autorizado

| Elemento | Valor |
|---|---|
| Maquina atacante | Kali Linux en maquina virtual |
| Maquina objetivo | Kioptrix Level 1 |
| Fuente objetivo | VulnHub / Kioptrix |
| Sistema representado | Servidor de servicios digitales municipales |
| Tipo de red | Host-only / red interna aislada |
| IP atacante | [PENDIENTE: completar con resultado real] |
| IP objetivo | [PENDIENTE: completar con resultado real] |
| Rango de red | [PENDIENTE: completar con resultado real] |

La red host-only / interna aislada se usara para evitar afectar sistemas externos, garantizar que todas las pruebas se realizan sobre activos autorizados y facilitar la reproducibilidad de evidencias.

## Justificacion del objetivo

Kioptrix Level 1 es una maquina vulnerable de laboratorio adecuada para desarrollar un ciclo completo de evaluacion: reconocimiento, identificacion de servicios, analisis de vulnerabilidades, explotacion controlada, posible escalada de privilegios y documentacion de evidencias.

Ademas, el objetivo elegido es diferente al sistema utilizado en el caso de estudio, donde se emplea Metasploitable3. Por tanto, cumple la condicion de seleccionar un objetivo distinto al ilustrado.

## Integrantes y roles

| Integrante | Rol | Responsabilidad principal |
|---|---|---|
| Trabajador 1 | Planificacion, metodologia y reconocimiento | Definir alcance, escenario, metodologia, entorno y reconocimiento inicial |
| Trabajador 2 | Vulnerabilidades, explotacion controlada y escalada | Analizar servicios, validar vulnerabilidades y documentar reproduccion controlada |
| Trabajador 3 | Evidencias, mitigacion, anexos e informe final | Consolidar evidencias, mitigaciones, matriz de riesgos y entrega final |

[PENDIENTE: sustituir Trabajador 1/2/3 por nombres reales si procede.]

## Servicios dentro del alcance

Los servicios dentro del alcance seran exclusivamente aquellos expuestos por Kioptrix Level 1 dentro de la red local aislada.

| Activo | IP | Servicio | Puerto | Permitido | Observaciones |
|---|---|---|---|---|---|
| Kioptrix Level 1 | [PENDIENTE] | [PENDIENTE: completar tras reconocimiento] | [PENDIENTE] | Si | Solo si aparece en evidencias reales |

## Alcance permitido

- Reconocimiento de red local.
- Identificacion de IP objetivo.
- Fingerprinting del sistema objetivo.
- Escaneo de puertos.
- Deteccion de servicios y versiones.
- Analisis de vulnerabilidades.
- Busqueda de CVE, CVSS y CWE.
- Consulta de NVD, CISA KEV, Exploit-DB y SearchSploit.
- Relacion de hallazgos con MITRE ATT&CK cuando proceda.
- Escaneo web basico con Nikto si existe servicio web.
- Explotacion controlada dentro del laboratorio, solo en la fase correspondiente.
- Escalada de privilegios controlada, si procede.
- Post-explotacion limitada a evidenciar impacto.
- Registro de logs, capturas y evidencias.
- Redaccion de informe tecnico y plan de mitigacion.

## Fuera del alcance

- Sistemas externos.
- Direcciones IP publicas.
- Servicios reales de terceros.
- Ataques de denegacion de servicio.
- Tecnicas destructivas.
- Persistencia maliciosa.
- Evasion de defensas.
- Malware.
- Exfiltracion real de informacion sensible.
- Modificacion innecesaria de datos.
- Uso de herramientas fuera del laboratorio autorizado.
- Movimiento lateral fuera de Kioptrix Level 1.

## Limitaciones

- La evaluacion se limita al entorno host-only / red interna aislada.
- Las IP reales se completaran cuando el laboratorio este desplegado.
- No se inventaran servicios, vulnerabilidades ni resultados.
- Todo hallazgo debera estar respaldado por evidencia.
- La explotacion no se ejecutara en esta fase documental.

## Consideraciones legales y eticas

Esta evaluacion tiene finalidad academica y defensiva. El equipo trabajara bajo los principios de autorizacion, minimo impacto, trazabilidad y reproduccion controlada. Cualquier accion fuera del alcance queda prohibida.

El uso de herramientas ofensivas solo estara permitido dentro del laboratorio autorizado y con objetivo pedagogico. No se generara malware, persistencia, evasion, DoS ni exfiltracion real de informacion sensible.

[PENDIENTE: completar declaracion de autorizacion academica o confirmacion del laboratorio propio.]
