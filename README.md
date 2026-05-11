# PAI 5 - RedTeamPro

## Evaluación de seguridad sobre un servidor de servicios digitales municipales

Este repositorio contiene la documentación, evidencias, anexos y scripts de apoyo del **PAI 5 - RedTeamPro** de la asignatura **Seguridad en Sistemas Informáticos e Internet**.

El proyecto consiste en una evaluación académica de seguridad tipo **Red Team / pentesting autorizado** sobre una organización pública ficticia: el **Ayuntamiento de Santa Marta**. El sistema evaluado representa un servidor de servicios digitales municipales desplegado en laboratorio mediante la máquina vulnerable **Kioptrix Level 1**.

La finalidad del proyecto es reproducir de forma controlada un ciclo completo de evaluación de seguridad:

1. Planificación.
2. Preparación del entorno.
3. Reconocimiento y fingerprinting.
4. Identificación de servicios.
5. Análisis de vulnerabilidades.
6. Explotación controlada, si procede.
7. Escalada de privilegios, si procede.
8. Post-explotación limitada, si procede.
9. Reporting técnico.
10. Plan de mitigación.

---

## Contexto académico y autorización

Este proyecto tiene una finalidad **exclusivamente académica, defensiva y formativa**.

Todas las pruebas se realizan únicamente dentro de una red local de laboratorio autorizada, aislada mediante una red **Host-only** en VirtualBox. No se ejecutan pruebas contra sistemas externos, direcciones IP públicas, dominios reales, servicios de terceros ni infraestructura ajena al laboratorio.

Queda expresamente fuera del alcance:

- Ataques contra sistemas externos.
- Ataques contra direcciones IP públicas.
- Denegación de servicio.
- Malware.
- Persistencia maliciosa.
- Evasión de defensas.
- Exfiltración real de información sensible.
- Técnicas destructivas.
- Movimiento lateral fuera del sistema objetivo autorizado.

---

## Escenario definido

| Elemento | Decisión |
|---|---|
| Organización ficticia | Ayuntamiento de Santa Marta |
| Sistema evaluado | Servidor de servicios digitales municipales |
| Tipo de evaluación | Red Team / pentesting autorizado |
| Modalidad | Black Box |
| Hipervisor | Oracle VirtualBox |
| Máquina atacante | Kali Linux |
| Máquina objetivo | Kioptrix Level 1 |
| Fuente del objetivo | VulnHub / Kioptrix |
| Tipo de red | Host-only / red interna aislada |
| Metodología principal | NIST SP 800-115 |

Kioptrix Level 1 se ha seleccionado porque permite documentar un ciclo completo de evaluación en laboratorio: reconocimiento, identificación de servicios, análisis de vulnerabilidades, explotación controlada, posible escalada de privilegios y reporting.

Además, este objetivo es diferente a **Metasploitable3**, que aparece como sistema ilustrativo en el caso de estudio del PAI.

---

## Estado actual del laboratorio

| Elemento | Valor |
|---|---|
| Máquina atacante | Kali Linux |
| IP atacante NAT | `10.0.2.15/24` |
| IP atacante Host-only | `192.168.56.101/24` |
| Interfaz de laboratorio | `eth1` |
| Máquina objetivo definitiva | Kioptrix Level 1 |
| IP objetivo definitiva | `192.168.56.102` |
| MAC objetivo | `08:00:27:D0:82:25` |
| Red de laboratorio | `192.168.56.0/24` |
| Sistema operativo estimado del objetivo | Linux 2.4.X |
| Detalle estimado por Nmap | Linux 2.4.9 - 2.4.18 |

Durante el descubrimiento inicial se detectó `192.168.56.100` como primer candidato, pero los resultados de escaneo no fueron coherentes con Kioptrix Level 1. Tras revisar la configuración de red y repetir el descubrimiento, se identificó `192.168.56.102` como sistema objetivo definitivo.

---

## Servicios identificados

El reconocimiento inicial y el escaneo completo de puertos TCP confirmaron que la superficie expuesta del objetivo se limita a los siguientes servicios:

| Puerto | Servicio | Versión / información detectada |
|---:|---|---|
| 22/tcp | SSH | OpenSSH 2.9p2, protocolo 1.99, soporte SSHv1 |
| 80/tcp | HTTP | Apache httpd 1.3.20, mod_ssl/2.8.4, OpenSSL/0.9.6b |
| 111/tcp | rpcbind | rpcbind v2, RPC #100000 |
| 139/tcp | NetBIOS/SMB | Samba smbd, workgroup MYGROUP |
| 443/tcp | HTTPS | Apache/1.3.20, mod_ssl/2.8.4, OpenSSL/0.9.6b, SSLv2 soportado |
| 32768/tcp | status/RPC | status v1, RPC #100024 |

La tabla completa se encuentra en:

```text
anexos/tabla_servicios.md
```

---

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

---

## Documentación principal

| Archivo | Descripción |
|---|---|
| `README.md` | Descripción general del proyecto, estructura y flujo de trabajo |
| `scope.md` | Alcance, límites, entorno autorizado y restricciones |
| `metodologia.md` | Metodología de evaluación basada en NIST SP 800-115 |
| `equipo.md` | Reparto de roles y responsabilidades |
| `informe/Informe_Tecnico_PAI5.md` | Informe técnico principal del proyecto |
| `anexos/comandos_ejecutados.md` | Registro trazable de comandos ejecutados |
| `anexos/tabla_servicios.md` | Servicios identificados durante el reconocimiento |
| `anexos/tabla_hallazgos.md` | Hallazgos candidatos o confirmados |
| `anexos/matriz_riesgos.md` | Criterios de probabilidad, impacto y prioridad |

---

## Flujo de trabajo recomendado

### 1. Planificación

- Completar `scope.md`.
- Definir organización ficticia, sistema evaluado y alcance.
- Confirmar roles del equipo en `equipo.md`.
- Definir restricciones técnicas, legales y éticas.
- Preparar carpetas de evidencias.

### 2. Preparación del entorno

- Arrancar Kali Linux.
- Arrancar Kioptrix Level 1.
- Confirmar red Host-only.
- Identificar IP atacante e IP objetivo.
- Guardar evidencias en `evidencias/entorno/`.

### 3. Reconocimiento y fingerprinting

- Descubrir hosts activos.
- Validar conectividad con el objetivo.
- Escanear puertos TCP.
- Detectar versiones de servicios.
- Estimar sistema operativo.
- Registrar comandos y evidencias.

Evidencias principales:

```text
evidencias/reconocimiento/descubrimiento_red.txt
evidencias/reconocimiento/ping_kioptrix.txt
evidencias/nmap/puertos_comunes.txt
evidencias/nmap/versiones_servicios.txt
evidencias/nmap/sistema_operativo.txt
evidencias/nmap/puertos_completos.txt
```

### 4. Análisis de vulnerabilidades

A partir de los servicios identificados, consultar:

- CVE.
- NVD.
- CVSS.
- CWE.
- CISA KEV.
- Exploit-DB.
- SearchSploit.
- Nikto, si procede para servicios web.

Los hallazgos deben documentarse en:

```text
anexos/tabla_hallazgos.md
```

### 5. Explotación controlada

Solo se ejecutará si procede, dentro del laboratorio autorizado y contra Kioptrix Level 1.

Toda prueba deberá incluir:

- Objetivo.
- Comando.
- Resultado esperado.
- Resultado obtenido.
- Evidencia asociada.
- Impacto.
- Mitigación preliminar.

### 6. Reporting y mitigación

- Consolidar resultados en `informe/Informe_Tecnico_PAI5.md`.
- Relacionar hallazgos con CVE/CVSS/CWE cuando proceda.
- Relacionar técnicas con MITRE ATT&CK cuando exista justificación.
- Priorizar riesgos mediante `anexos/matriz_riesgos.md`.
- Proponer mitigaciones técnicas concretas.

---

## Gestión de evidencias

Cada evidencia debe ser trazable a:

- Comando ejecutado.
- Fecha/hora aproximada.
- Responsable.
- Objetivo.
- Resultado esperado.
- Resultado obtenido.
- Ruta del archivo generado.

Las evidencias se guardan por categoría:

| Tipo de evidencia | Ruta |
|---|---|
| Entorno | `evidencias/entorno/` |
| Reconocimiento | `evidencias/reconocimiento/` |
| Nmap | `evidencias/nmap/` |
| Nikto | `evidencias/nikto/` |
| SearchSploit | `evidencias/searchsploit/` |
| Vulnerabilidades | `evidencias/vulnerabilidades/` |
| Explotación | `evidencias/explotacion/` |
| Post-explotación | `evidencias/post-explotacion/` |
| Capturas | `evidencias/capturas/` |
| Logs | `evidencias/logs/` |

Reglas:

- No modificar evidencias originales.
- No inventar resultados.
- Usar rutas relativas al proyecto.
- Registrar también resultados inesperados si aportan información.
- Diferenciar entre servicio identificado, indicio técnico, vulnerabilidad confirmada y explotación validada.

---

## Scripts disponibles

Los scripts existentes están limitados a reconocimiento y generación de plantillas. No ejecutan explotación, persistencia, evasión, DoS ni acciones destructivas.

### Reconocimiento Nmap sobre IP autorizada

```bash
bash scripts/run_recon.sh <IP_OBJETIVO>
```

### Escaneo web básico con Nikto sobre URL/IP autorizada

```bash
bash scripts/run_web_scan.sh <URL_O_IP>
```

### Generación de plantilla CSV de hallazgos

```bash
python3 scripts/generate_findings_template.py
```

---

## Roles del equipo

| Rol | Responsabilidad |
|---|---|
| Rol 1 - Planificación, metodología y reconocimiento | Definir alcance, entorno, metodología, reconocimiento inicial y tabla de servicios |
| Rol 2 - Vulnerabilidades, explotación controlada y escalada | Analizar servicios, buscar CVE/CVSS/CWE, validar vulnerabilidades y documentar pruebas |
| Rol 3 - Evidencias, mitigación, anexos e informe final | Consolidar evidencias, matriz de riesgos, mitigaciones, conclusiones y entrega final |

El Rol 1 ha dejado completadas las fases de planificación, reconocimiento, fingerprinting e identificación de servicios.

---

## Estado actual del proyecto

| Fase | Estado |
|---|---|
| Planificación | Completada por Rol 1 |
| Preparación del entorno | Completada por Rol 1 |
| Reconocimiento / fingerprinting | Completada por Rol 1 |
| Identificación de servicios | Completada por Rol 1 |
| Análisis de vulnerabilidades | Pendiente de Rol 2 |
| Explotación controlada | Pendiente de Rol 2, si procede |
| Escalada de privilegios | Pendiente de Rol 2, si procede |
| Post-explotación | Pendiente de Rol 2 / Rol 3, si procede |
| Plan de mitigación | Pendiente de Rol 3 |
| Informe final | En progreso |

---

## Contenido esperado del ZIP final

El ZIP final debe incluir:

- `README.md`
- `scope.md`
- `metodologia.md`
- `equipo.md`
- `informe/Informe_Tecnico_PAI5.md`
- Informe técnico en PDF, si procede
- Evidencias reales organizadas por categoría
- Logs de comandos
- Capturas
- Tabla de servicios
- Tabla de hallazgos
- Matriz de riesgos
- Scripts utilizados
- Configuraciones relevantes del laboratorio
- Justificación de alcance, metodología y restricciones

Antes de entregar, se debe comprobar que los marcadores `[PENDIENTE: ...]` han sido completados o se mantienen justificados por ausencia de resultados reales.

---

## Advertencia final

Este proyecto no debe utilizarse para atacar sistemas reales. Todo el contenido, comandos, scripts y evidencias están orientados exclusivamente a un laboratorio académico autorizado.