# Equipo y Reparto de Responsabilidades

El equipo se organiza en tres roles complementarios para cubrir de forma equilibrada planificacion, ejecucion tecnica, evidencias, mitigacion e informe final.

| Rol | Responsable | Responsabilidades | Entregables | Carga aproximada |
|---|---|---|---|---|
| Rol 1 - Planificacion, metodologia y reconocimiento | Trabajador 1 | Definir alcance, justificar escenario, documentar Ayuntamiento de Santa Marta, documentar entorno Kali + Kioptrix, definir metodologia NIST 800-115, ejecutar reconocimiento inicial, identificar IP, puertos, servicios y versiones, completar tabla de servicios y entregar base tecnica al Rol 2 | `README.md`, `scope.md`, `metodologia.md`, evidencias de entorno/reconocimiento, `anexos/tabla_servicios.md`, registro de comandos iniciales | 34% |
| Rol 2 - Vulnerabilidades, explotacion controlada y escalada | Trabajador 2 | Analizar servicios, buscar CVE/CVSS/CWE, consultar SearchSploit, Exploit-DB y NVD, validar vulnerabilidades de forma controlada, ejecutar explotacion dentro del alcance si procede, comprobar posible escalada y documentar pasos de reproduccion | Evidencias de vulnerabilidades, pruebas controladas, relacion CVE/CVSS/CWE, pasos reproducibles, impacto tecnico | 33% |
| Rol 3 - Evidencias, mitigacion, anexos e informe final | Trabajador 3 | Organizar logs y capturas, completar fichas de hallazgos, crear matriz de riesgos, redactar mitigaciones, revisar coherencia del informe, preparar PDF final y ZIP entregable | Informe final, anexos completos, matriz de riesgos, mitigaciones, capturas organizadas, ZIP final | 33% |

## Coordinacion

- Todas las pruebas deben limitarse a Kioptrix Level 1 dentro de la red host-only / interna aislada.
- Cada comando relevante se registrara en `anexos/comandos_ejecutados.md`.
- Cada evidencia debe incluir ruta, fecha aproximada, responsable y objetivo.
- Ningun hallazgo se considerara confirmado sin evidencia.
- La explotacion y escalada solo se ejecutaran en fases posteriores y dentro del alcance.
- Quedan prohibidos DoS, malware, persistencia, evasion, exfiltracion real y acciones destructivas.

[PENDIENTE: sustituir Trabajador 1/2/3 por nombres reales si procede.]
