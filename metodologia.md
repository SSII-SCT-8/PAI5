# Metodologia

La evaluacion seguira NIST SP 800-115, Technical Guide to Information Security Testing and Assessment, adaptada a un entorno academico de laboratorio. El proceso se divide en planificacion, ejecucion y post-ejecucion/reporting.

## 1. Planificacion

Objetivo: definir el alcance, permisos, activos, restricciones, responsables y criterios de exito antes de ejecutar pruebas.

Actividades:

- Definir Security Team, roles y responsabilidades.
- Identificar activos dentro y fuera de alcance.
- Documentar IP atacante, IP objetivo y tipo de red.
- Establecer pruebas permitidas y prohibidas.
- Preparar estructura de evidencias.
- Acordar formato de reporte y anexos.

Salida esperada:

- `scope.md` completado.
- `equipo.md` validado.
- Carpetas de evidencias preparadas.

[PENDIENTE: completar con datos reales del laboratorio.]

## 2. Reconocimiento / Discovery

Objetivo: identificar si el objetivo esta activo, que puertos expone y que servicios pueden analizarse.

Actividades permitidas:

- Comprobacion de host activo.
- Escaneo de puertos comunes.
- Deteccion de servicios y versiones.
- Deteccion de sistema operativo cuando proceda.
- Registro de comandos y evidencias.

Herramientas previstas:

- Nmap para descubrimiento y fingerprinting.
- Nikto para revision web basica si existe servicio HTTP/HTTPS.

Salida esperada:

- Evidencias en `evidencias/nmap/` y `evidencias/nikto/`.
- Servicios consolidados en `anexos/tabla_servicios.md`.

[PENDIENTE: completar con resultados reales.]

## 3. Analisis de vulnerabilidades

Objetivo: relacionar servicios y versiones detectadas con vulnerabilidades documentadas y verificables.

Actividades:

- Buscar vulnerabilidades asociadas a servicios y versiones.
- Consultar CVE, NVD, CVSS, CWE y CISA KEV.
- Priorizar hallazgos segun exposicion, impacto y probabilidad.
- Evitar concluir vulnerabilidad solo por coincidencia de version sin validacion.

Salida esperada:

- Hallazgos candidatos en `anexos/tabla_hallazgos.md`.
- Evidencias en `evidencias/vulnerabilidades/`.

[PENDIENTE: completar con hallazgos reales.]

## 4. Explotacion controlada

Objetivo: validar impacto de forma limitada, autorizada y reproducible, sin afectar sistemas externos.

Condiciones:

- Solo se ejecutara si el alcance lo permite.
- Solo contra la maquina objetivo autorizada.
- Cada prueba debe tener objetivo, comando, resultado esperado y evidencia.
- No se permitira persistencia, malware, evasiones ni acciones destructivas.

Salida esperada:

- Evidencias en `evidencias/explotacion/`.
- Impacto validado o descartado en el informe.

[PENDIENTE: completar solo cuando se ejecuten pruebas reales y autorizadas.]

## 5. Escalada de privilegios

Objetivo: evaluar si una vulnerabilidad validada permite ampliar privilegios dentro del entorno autorizado.

Condiciones:

- Debe partir de una explotacion controlada documentada.
- No se modificaran configuraciones permanentes salvo que sea imprescindible y autorizado.
- Se registraran comandos, evidencias y estado final.

Salida esperada:

- Evidencias en `evidencias/post-explotacion/` o `evidencias/explotacion/`.
- Riesgo e impacto documentados.

[PENDIENTE: completar con evidencias reales si aplica.]

## 6. Post-explotacion

Objetivo: documentar el impacto potencial sin exfiltrar datos sensibles ni mantener acceso.

Actividades permitidas:

- Verificacion minima de privilegios obtenidos.
- Identificacion de impacto tecnico.
- Captura de evidencia controlada.
- Limpieza o restauracion si procede.

Actividades prohibidas:

- Persistencia.
- Evasion.
- Movimiento lateral fuera del alcance.
- Exfiltracion de informacion sensible.

[PENDIENTE: completar con resultados reales si aplica.]

## 7. Reporting

Objetivo: consolidar resultados, evidencias, riesgos y mitigaciones en un informe tecnico claro.

Actividades:

- Completar el informe tecnico.
- Relacionar evidencias con comandos y hallazgos.
- Asignar severidad y prioridad.
- Proponer mitigaciones verificables.
- Revisar consistencia, trazabilidad y ausencia de datos inventados.

Salida esperada:

- `informe/Informe_Tecnico_PAI5.md` completado.
- Anexos completos.
- ZIP final preparado.

## Uso de fuentes y marcos de referencia

- MITRE ATT&CK: se usara para mapear tacticas y tecnicas observadas o potencialmente aplicables en el entorno evaluado. No se asignara una tecnica sin evidencia o justificacion.
- CVE: se usara para identificar vulnerabilidades publicas asociadas a productos o versiones concretas.
- NVD: se usara como fuente de informacion tecnica, puntuaciones CVSS y referencias.
- CVSS: se usara para estimar severidad tecnica, complementada con contexto del laboratorio.
- CWE: se usara para clasificar debilidades subyacentes cuando proceda.
- CISA KEV: se usara para priorizar vulnerabilidades conocidas explotadas activamente, si alguna aplica al entorno.

[PENDIENTE: completar referencias concretas para cada hallazgo real.]
