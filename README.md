# PAI5 - RedTeamPro

## Objetivo del proyecto

Este repositorio contiene la documentacion, plantillas, evidencias y scripts seguros del PAI 5 de la asignatura Seguridad en Sistemas Informaticos e Internet: "RedTeamPro: Evaluacion de la seguridad de la informacion mediante pruebas de seguridad de una organizacion publica".

El proyecto consiste en una evaluacion Red Team / pentesting autorizado sobre una organizacion publica ficticia, el Ayuntamiento de Santa Marta. El sistema evaluado sera un servidor de servicios digitales municipales representado en laboratorio por la maquina vulnerable Kioptrix Level 1.

La finalidad es reproducir de forma academica un ciclo de evaluacion completo: planificacion, reconocimiento, fingerprinting, identificacion de servicios, analisis de vulnerabilidades, explotacion controlada si procede, escalada de privilegios si procede, post-explotacion limitada, reporting y plan de mitigacion.

## Contexto academico y autorizado

Este proyecto es exclusivamente academico. Todas las pruebas se realizaran unicamente en una red local de laboratorio autorizada, aislada mediante red host-only / red interna.

Queda prohibido ejecutar pruebas contra sistemas externos, direcciones IP publicas, servicios reales de terceros o cualquier activo no autorizado. No se debe ejecutar explotacion hasta que el alcance este cerrado, el objetivo sea confirmado y cada accion quede registrada.

## Escenario definido

| Elemento | Decision |
|---|---|
| Organizacion ficticia | Ayuntamiento de Santa Marta |
| Sistema evaluado | Servidor de servicios digitales municipales |
| Tipo de prueba | Black Box |
| Entorno atacante | Kali Linux en maquina virtual |
| Sistema objetivo | Kioptrix Level 1 |
| Fuente del objetivo | VulnHub / Kioptrix |
| Tipo de red | Host-only / red interna aislada |
| Metodologia principal | NIST SP 800-115 |

Kioptrix Level 1 se usara porque permite documentar un ciclo completo de evaluacion en laboratorio y es diferente a Metasploitable3, que aparece como sistema ilustrativo en el caso de estudio.

## Estructura del proyecto

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

1. Completar `scope.md` con IP atacante, IP objetivo, red de laboratorio y autorizacion.
2. Registrar versiones de herramientas y configuracion del laboratorio en `evidencias/entorno/`.
3. Ejecutar reconocimiento no destructivo contra Kioptrix Level 1 dentro de la red host-only.
4. Guardar salidas tecnicas en `evidencias/reconocimiento/`, `evidencias/nmap/` y `evidencias/nikto/`.
5. Registrar cada comando en `anexos/comandos_ejecutados.md`.
6. Completar `anexos/tabla_servicios.md` solo con servicios observados en evidencias reales.
7. Analizar vulnerabilidades con CVE, NVD, CVSS, CWE, CISA KEV, Exploit-DB y SearchSploit.
8. Mapear hallazgos a MITRE ATT&CK cuando exista justificacion.
9. Completar `informe/Informe_Tecnico_PAI5.md` sin inventar resultados.
10. Revisar anexos, capturas y evidencias antes de generar el ZIP final.

## Evidencias

Cada evidencia debe ser trazable a un comando, fecha, responsable y objetivo. Se recomienda:

- Guardar salidas de herramientas en texto plano.
- Guardar capturas en `evidencias/capturas/`.
- Separar resultados por herramienta o fase.
- No modificar evidencias originales.
- Referenciar rutas relativas en tablas y anexos.

Formato recomendado:

```text
evidencias/<categoria>/<timestamp>/<descripcion>.txt
```

## Scripts disponibles

Los scripts existentes estan limitados a reconocimiento y generacion de plantillas. No ejecutan explotacion, persistencia, evasion, DoS ni acciones destructivas.

Reconocimiento Nmap sobre IP autorizada:

```bash
bash scripts/run_recon.sh <IP_OBJETIVO>
```

Escaneo web basico con Nikto sobre URL/IP autorizada:

```bash
bash scripts/run_web_scan.sh <URL_O_IP>
```

Generacion de plantilla CSV de hallazgos:

```bash
python3 scripts/generate_findings_template.py
```

## Contenido esperado del ZIP final

El ZIP final debe incluir:

- Documentacion base completada: `README.md`, `scope.md`, `metodologia.md`, `equipo.md`.
- Informe tecnico final en `informe/Informe_Tecnico_PAI5.md` y, si procede, PDF generado.
- Evidencias reales organizadas por categoria.
- Logs de comandos y capturas.
- Tabla de servicios, tabla de hallazgos y matriz de riesgos.
- Scripts usados durante el reconocimiento.
- Configuraciones relevantes del laboratorio.
- Justificacion de alcance, metodologia y restricciones.

Antes de entregar, comprobar que los marcadores `[PENDIENTE: ...]` han sido completados o se mantienen justificados por ausencia de resultados reales.
