# Metodologia

La evaluacion seguira NIST SP 800-115, Technical Guide to Information Security Testing and Assessment, como metodologia principal. El enfoque se adapta a un ejercicio academico Red Team / pentesting autorizado sobre el Ayuntamiento de Santa Marta, usando Kali Linux como maquina atacante y Kioptrix Level 1 como objetivo en una red host-only / interna aislada.

No se ejecutara explotacion durante la preparacion documental. Las fases tecnicas se realizaran posteriormente solo dentro del alcance autorizado.

## Fases del proyecto

| Fase | Objetivo | Salida esperada |
|---|---|---|
| Planificacion | Definir alcance, autorizacion, roles, entorno y limites | `scope.md`, `equipo.md`, estructura de evidencias |
| Reconocimiento / fingerprinting | Identificar host, puertos, servicios, versiones y sistema operativo si procede | Evidencias en `evidencias/reconocimiento/` y `evidencias/nmap/` |
| Identificacion de servicios | Transformar salidas tecnicas en una tabla clara | `anexos/tabla_servicios.md` |
| Analisis de vulnerabilidades | Relacionar servicios/versiones con vulnerabilidades documentadas | `anexos/tabla_hallazgos.md` y evidencias |
| Explotacion controlada | Validar impacto de forma limitada y autorizada | Evidencias en `evidencias/explotacion/` |
| Escalada de privilegios | Evaluar ampliacion de privilegios si procede | Evidencias reproducibles y limitadas |
| Post-explotacion | Evidenciar impacto sin persistencia ni exfiltracion | Capturas/logs controlados |
| Reporting | Consolidar resultados, riesgos y mitigaciones | Informe tecnico y anexos |
| Plan de mitigacion | Proponer medidas correctivas priorizadas | Matriz de riesgos y recomendaciones |

## Herramientas previstas por fase

| Fase | Herramientas |
|---|---|
| Reconocimiento | `ip`, `ping`, `nmap` |
| Fingerprinting | `nmap -O`, `nmap -sV`, `nmap -sC` |
| Analisis de vulnerabilidades | SearchSploit, Exploit-DB, NVD/CVE, Nikto si hay servicio web |
| Explotacion controlada | Metasploit si procede, PoC controladas si procede |
| Escalada | LinPEAS si procede |
| Documentacion | Markdown, logs de comandos, capturas, tablas de hallazgos |

El uso de herramientas se registrara en `anexos/comandos_ejecutados.md` y cada evidencia se guardara en la carpeta correspondiente.

## 1. Planificacion

Objetivo: cerrar el escenario del Ayuntamiento de Santa Marta, definir el activo Kioptrix Level 1, documentar la red host-only, asignar roles y establecer pruebas permitidas y prohibidas.

Actividades:

- Definir organizacion ficticia y sistema evaluado.
- Justificar prueba Black Box.
- Confirmar Kali Linux como atacante y Kioptrix Level 1 como objetivo.
- Documentar red host-only / interna aislada.
- Definir alcance permitido y fuera de alcance.
- Preparar informe, anexos y estructura de evidencias.

[PENDIENTE: completar IP atacante, IP objetivo y autorizacion del laboratorio.]

## 2. Reconocimiento / fingerprinting

Objetivo: identificar de forma no destructiva la superficie expuesta por Kioptrix Level 1.

Actividades:

- Identificar IP atacante y rango de red.
- Descubrir IP objetivo dentro de la red local.
- Comprobar host activo.
- Escanear puertos.
- Detectar servicios y versiones.
- Intentar deteccion de sistema operativo si procede.

No se usaran opciones agresivas innecesarias ni pruebas destructivas.

[PENDIENTE: completar con resultados reales.]

## 3. Identificacion de servicios

Objetivo: convertir los resultados de Nmap y otras herramientas en una tabla objetiva de servicios.

La tabla de servicios no debe marcar un servicio como vulnerable sin validacion posterior. Se usaran observaciones como "requiere analisis" cuando proceda.

[PENDIENTE: completar `anexos/tabla_servicios.md` con evidencias reales.]

## 4. Analisis de vulnerabilidades

Objetivo: relacionar servicios y versiones detectadas con vulnerabilidades publicas verificables.

Fuentes previstas:

- CVE para identificadores publicos de vulnerabilidades.
- NVD para descripcion, referencias y puntuacion CVSS.
- CVSS para severidad tecnica.
- CWE para clasificacion de debilidades.
- CISA KEV para priorizar vulnerabilidades explotadas en el mundo real.
- Exploit-DB y SearchSploit para localizar informacion tecnica y PoC conocidas.

No se confirmara ninguna vulnerabilidad solo por coincidencia de version sin evidencia o validacion razonable.

[PENDIENTE: completar con hallazgos reales.]

## 5. Explotacion controlada

Objetivo: validar impacto tecnico dentro del laboratorio autorizado, solo cuando el equipo alcance esa fase.

Condiciones:

- Solo contra Kioptrix Level 1.
- Solo dentro de la red host-only / interna aislada.
- Sin DoS, persistencia, evasion, malware ni acciones destructivas.
- Cada prueba debe tener comando, resultado esperado, resultado obtenido y evidencia.

[PENDIENTE: completar solo si se ejecutan pruebas reales autorizadas.]

## 6. Escalada de privilegios

Objetivo: comprobar si un acceso obtenido permite elevar privilegios dentro del sistema objetivo, de forma limitada y documentada.

Herramientas como LinPEAS podran usarse si procede y si su ejecucion esta dentro del alcance. La finalidad sera documentar impacto, no mantener acceso ni modificar innecesariamente el sistema.

[PENDIENTE: completar si aplica.]

## 7. Post-explotacion

Objetivo: documentar impacto potencial sin exfiltracion real ni persistencia.

Actividades permitidas:

- Verificacion minima de usuario/privilegios.
- Captura de evidencias controladas.
- Registro de estado y limpieza si procede.

[PENDIENTE: completar si aplica.]

## 8. Reporting y plan de mitigacion

Objetivo: consolidar resultados reales, evidencias, riesgo y recomendaciones.

El informe debe incluir:

- Alcance y autorizacion.
- Metodologia aplicada.
- Evidencias de reconocimiento.
- Servicios identificados.
- Hallazgos confirmados.
- Relacion con CVE/CVSS/CWE y MITRE ATT&CK.
- Plan de mitigacion priorizado.
- Limitaciones y conclusiones.

## Uso de MITRE ATT&CK

MITRE ATT&CK se usara para contextualizar hallazgos dentro de tacticas y tecnicas reales de adversarios. El mapeo se hara solo cuando exista justificacion basada en evidencias, por ejemplo servicios expuestos, vulnerabilidades confirmadas o acciones reproducidas en laboratorio.

## Criterios de priorizacion de hallazgos

La prioridad se asignara combinando:

- Severidad CVSS.
- Probabilidad e impacto definidos en `anexos/matriz_riesgos.md`.
- Exposicion del servicio afectado.
- Existencia de CVE publico.
- Presencia en CISA KEV.
- Disponibilidad de exploit o PoC en Exploit-DB/SearchSploit.
- Facilidad de reproduccion en laboratorio.
- Impacto sobre confidencialidad, integridad y disponibilidad.
- Viabilidad de mitigacion.

[PENDIENTE: aplicar criterios a hallazgos reales.]
