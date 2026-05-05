# PAI5 - RedTeamPro

## Objetivo del proyecto

Este repositorio organiza el entregable del PAI 5 de la asignatura Seguridad en Sistemas Informaticos e Internet: "RedTeamPro: Evaluacion de la seguridad de la informacion mediante pruebas de seguridad de una organizacion publica".

El objetivo es documentar y ejecutar una evaluacion de seguridad autorizada, de tipo Red Team/pentesting, sobre un entorno de laboratorio propio o expresamente autorizado. El trabajo seguira la metodologia NIST SP 800-115, cubriendo planificacion, ejecucion controlada y post-ejecucion/reporting.

[PENDIENTE: completar con el nombre definitivo del equipo, integrantes y entorno de laboratorio.]

## Contexto academico

Este proyecto tiene finalidad exclusivamente academica. Las pruebas, comandos y evidencias deben limitarse al entorno definido en `scope.md` y no deben ejecutarse contra sistemas externos, redes publicas o activos sin autorizacion.

## Advertencia de uso autorizado

El contenido de este repositorio esta destinado unicamente a actividades de evaluacion defensiva y autorizada. No se permite usar estos materiales para atacar, degradar, evadir controles, mantener persistencia, exfiltrar informacion o comprometer sistemas ajenos.

No se debe ejecutar explotacion hasta que el alcance, autorizacion, entorno y responsables esten claramente definidos y aprobados.

## Estructura de carpetas

```text
PAI5-RedTeamPro/
|-- README.md
|-- scope.md
|-- metodologia.md
|-- equipo.md
|-- informe/
|   |-- Informe_Tecnico_PAI5.md
|   `-- assets/
|-- evidencias/
|   |-- entorno/
|   |-- reconocimiento/
|   |-- nmap/
|   |-- nikto/
|   |-- searchsploit/
|   |-- vulnerabilidades/
|   |-- explotacion/
|   |-- post-explotacion/
|   |-- capturas/
|   `-- logs/
|-- scripts/
|   |-- run_recon.sh
|   |-- run_web_scan.sh
|   `-- generate_findings_template.py
|-- anexos/
|   |-- comandos_ejecutados.md
|   |-- tabla_servicios.md
|   |-- tabla_hallazgos.md
|   `-- matriz_riesgos.md
`-- configuraciones/
```

## Flujo de trabajo recomendado

1. Completar `scope.md` antes de ejecutar cualquier prueba.
2. Registrar el entorno atacante y objetivo en `evidencias/entorno/`.
3. Ejecutar reconocimiento no destructivo con los scripts de `scripts/`.
4. Registrar cada comando en `anexos/comandos_ejecutados.md`.
5. Transferir resultados confirmados a `anexos/tabla_servicios.md` y `anexos/tabla_hallazgos.md`.
6. Relacionar hallazgos con CVE, CVSS, CWE, NVD, CISA KEV y MITRE ATT&CK cuando proceda.
7. Completar `informe/Informe_Tecnico_PAI5.md` con evidencias reales.
8. Revisar que no haya datos inventados ni pruebas fuera de alcance.

## Gestion de evidencias

Cada evidencia debe guardarse con una ruta trazable, fecha y responsable. Se recomienda:

- Guardar salidas de herramientas en texto plano cuando sea posible.
- Mantener capturas en `evidencias/capturas/`.
- Separar resultados por herramienta: `nmap/`, `nikto/`, `searchsploit/`.
- Registrar la ruta exacta de cada evidencia en los anexos.
- No modificar evidencias originales; si se necesita trabajar sobre ellas, crear una copia.

Formato recomendado:

```text
evidencias/<categoria>/<timestamp>/<descripcion>.txt
```

## Ejecucion de scripts de reconocimiento

Los scripts estan preparados para reconocimiento no destructivo y solo deben ejecutarse contra activos autorizados.

Reconocimiento de red con Nmap:

```bash
bash scripts/run_recon.sh <IP_OBJETIVO>
```

Escaneo web basico con Nikto:

```bash
bash scripts/run_web_scan.sh <URL_O_IP>
```

Generacion de plantilla CSV de hallazgos:

```bash
python3 scripts/generate_findings_template.py
```

[PENDIENTE: completar con IP atacante, IP objetivo y fecha de ejecucion real.]

## Contenido esperado del ZIP final

El ZIP final debe incluir:

- Documentacion base completada: `README.md`, `scope.md`, `metodologia.md`, `equipo.md`.
- Informe tecnico completo en `informe/Informe_Tecnico_PAI5.md`.
- Evidencias reales organizadas por categoria.
- Anexos actualizados con comandos, servicios, hallazgos y matriz de riesgos.
- Scripts utilizados para reconocimiento.
- Configuraciones relevantes del laboratorio.
- Capturas necesarias para justificar los resultados.

Antes de entregar, comprobar que todos los marcadores `[PENDIENTE: ...]` han sido completados o justificados.
