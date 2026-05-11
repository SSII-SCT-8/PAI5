# Alcance de la Evaluación

## Security Team

- **Proyecto:** PAI 5 - RedTeamPro
- **Asignatura:** Seguridad en Sistemas Informáticos e Internet
- **Equipo:** SCT-8
- **Responsable del Rol 1:** Juan Cardesa

---

## Contexto de la organización evaluada

La organización evaluada será el **Ayuntamiento de Santa Marta**, una entidad pública ficticia utilizada exclusivamente para contextualizar el ejercicio académico. El activo evaluado representa un servidor de servicios digitales municipales expuesto dentro de una red local de laboratorio.

Este servidor simula un sistema potencialmente utilizado para prestar servicios digitales básicos a la ciudadanía, como portales web, servicios auxiliares de administración o mecanismos de acceso remoto. La finalidad de esta contextualización es poder interpretar los hallazgos técnicos en términos de impacto sobre una organización pública: disponibilidad de servicios, confidencialidad de información, integridad de los sistemas y riesgo reputacional.

No se evaluará ningún ayuntamiento real, dominio público, dirección IP externa, servicio de terceros ni infraestructura ajena al laboratorio autorizado.

---

## Tipo de prueba

- **Modalidad:** Black Box.
- **Justificación:** el equipo actuará como un atacante externo autorizado, sin conocimiento interno previo del sistema objetivo. La información inicial se limita a la existencia del activo dentro de una red de laboratorio controlada.
- **Objetivo técnico:** identificar la superficie expuesta del sistema, servicios activos, versiones, posibles vulnerabilidades y riesgos asociados, siempre a partir de evidencias reales obtenidas durante la evaluación.
- **Restricción principal:** no se inventarán servicios, vulnerabilidades ni resultados. Todo hallazgo deberá estar respaldado por evidencias técnicas reproducibles.

---

## Entorno autorizado

| Elemento | Valor |
|---|---|
| Hipervisor | Oracle VirtualBox |
| Máquina atacante | Kali Linux en máquina virtual |
| Sistema atacante | Kali GNU/Linux Rolling |
| Kernel atacante | Linux 6.18.12+kali-amd64 |
| Interfaz NAT atacante | `eth0` |
| IP NAT atacante | `10.0.2.15/24` |
| Interfaz Host-only atacante | `eth1` |
| IP atacante Host-only | `192.168.56.101/24` |
| Máquina objetivo | Kioptrix Level 1 |
| Fuente objetivo | VulnHub / Kioptrix |
| Sistema representado | Servidor de servicios digitales municipales |
| Tipo de red | Host-only / red interna aislada |
| Rango de red del laboratorio | `192.168.56.0/24` |
| IP objetivo definitiva | `192.168.56.102` |
| MAC objetivo | `08:00:27:D0:82:25` |
| Enfoque de evaluación | Black Box |

La red **Host-only** se utiliza para evitar afectar sistemas externos, garantizar que todas las pruebas se realizan sobre activos autorizados y facilitar la reproducibilidad de las evidencias. La máquina atacante conserva una interfaz NAT para conectividad propia, pero las pruebas sobre el objetivo se realizan exclusivamente a través de la interfaz Host-only del laboratorio.

Durante la preparación del entorno se detectó inicialmente el host `192.168.56.100` como candidato, pero los resultados de escaneo no fueron coherentes con Kioptrix Level 1. Tras revisar la configuración de red y repetir el descubrimiento, se identificó `192.168.56.102` como sistema objetivo definitivo.

---

## Justificación del objetivo

Se ha seleccionado **Kioptrix Level 1** como sistema objetivo por tratarse de una máquina vulnerable de laboratorio diseñada para prácticas de evaluación de seguridad y pruebas de penetración. Su uso resulta adecuado para desarrollar un ciclo completo de evaluación: reconocimiento, identificación de servicios, análisis de vulnerabilidades, explotación controlada, posible escalada de privilegios y documentación de evidencias.

Además, el objetivo elegido es diferente al sistema utilizado en el caso de estudio, donde se emplea Metasploitable3. Por tanto, cumple la condición de seleccionar un sistema objetivo distinto al ilustrado en el material de referencia.

Kioptrix Level 1 permite simular un entorno heredado con servicios antiguos expuestos, lo que resulta especialmente útil para analizar riesgos habituales en infraestructuras públicas con sistemas desactualizados o insuficientemente mantenidos.

---

## Integrantes y roles

| Integrante | Rol | Responsabilidad principal |
|---|---|---|
| Juan Cardesa | Planificación, metodología y reconocimiento | Definir alcance, escenario, metodología, entorno de laboratorio y reconocimiento inicial |
| [PENDIENTE: nombre] | Vulnerabilidades, explotación controlada y escalada | Analizar servicios, buscar CVE/CVSS/CWE, validar vulnerabilidades y documentar reproducción controlada |
| [PENDIENTE: nombre] | Evidencias, mitigación, anexos e informe final | Consolidar evidencias, elaborar matriz de riesgos, redactar mitigaciones y preparar la entrega final |

---

## Servicios dentro del alcance

Los servicios dentro del alcance serán exclusivamente aquellos expuestos por **Kioptrix Level 1** dentro de la red local aislada `192.168.56.0/24`.

El reconocimiento inicial y el escaneo completo de puertos TCP han confirmado que los servicios expuestos por el objetivo son los siguientes:

| Activo | IP | Servicio | Puerto | Estado | Permitido | Observaciones |
|---|---|---|---:|---|---|---|
| Kioptrix Level 1 | `192.168.56.102` | SSH | 22/tcp | Abierto | Sí | OpenSSH 2.9p2, con soporte SSHv1 |
| Kioptrix Level 1 | `192.168.56.102` | HTTP | 80/tcp | Abierto | Sí | Apache httpd 1.3.20 sobre Red Hat/Linux |
| Kioptrix Level 1 | `192.168.56.102` | rpcbind | 111/tcp | Abierto | Sí | rpcbind v2, RPC #100000 |
| Kioptrix Level 1 | `192.168.56.102` | NetBIOS/SMB | 139/tcp | Abierto | Sí | Samba smbd, workgroup MYGROUP |
| Kioptrix Level 1 | `192.168.56.102` | HTTPS | 443/tcp | Abierto | Sí | Apache/1.3.20, mod_ssl/2.8.4, OpenSSL/0.9.6b |
| Kioptrix Level 1 | `192.168.56.102` | status/RPC | 32768/tcp | Abierto | Sí | Servicio RPC asociado al puerto 111 |

El escaneo completo de puertos TCP confirmó que no existen puertos TCP adicionales abiertos fuera de los anteriores.

---

## Alcance permitido

Las actividades permitidas dentro del alcance son:

- Reconocimiento de red local.
- Identificación de la IP del sistema objetivo.
- Fingerprinting del sistema objetivo.
- Escaneo de puertos TCP.
- Detección de servicios y versiones.
- Detección aproximada del sistema operativo.
- Análisis de vulnerabilidades.
- Búsqueda de referencias CVE, CVSS y CWE.
- Consulta de NVD, CISA KEV, Exploit-DB y SearchSploit.
- Relación de hallazgos con MITRE ATT&CK cuando proceda.
- Escaneo web básico con herramientas como Nikto si procede.
- Enumeración controlada de servicios expuestos.
- Explotación controlada dentro del laboratorio, únicamente en la fase correspondiente.
- Escalada de privilegios controlada, si procede.
- Post-explotación limitada a evidenciar impacto.
- Registro de logs, salidas de comandos, capturas y evidencias.
- Redacción del informe técnico y del plan de mitigación.

---

## Fuera del alcance

Quedan expresamente fuera del alcance:

- Sistemas externos.
- Direcciones IP públicas.
- Servicios reales de terceros.
- Dominios de Internet.
- Infraestructura de la Universidad de Sevilla no incluida explícitamente en el laboratorio.
- Ataques de denegación de servicio.
- Técnicas destructivas.
- Persistencia maliciosa.
- Evasión de defensas.
- Malware.
- Exfiltración real de información sensible.
- Modificación innecesaria de datos.
- Uso de herramientas fuera del laboratorio autorizado.
- Movimiento lateral fuera de Kioptrix Level 1.
- Ataques contra la máquina anfitriona Windows.
- Ataques contra otros equipos conectados a la red física del usuario.

---

## Limitaciones

- La evaluación se limita al entorno Host-only / red interna aislada.
- El sistema objetivo es una máquina vulnerable de laboratorio, por lo que los resultados deben interpretarse dentro de un contexto académico.
- No se inventarán servicios, vulnerabilidades ni resultados.
- Todo hallazgo deberá estar respaldado por evidencias técnicas.
- La explotación no forma parte de la fase de planificación y reconocimiento, sino de la fase posterior asignada al rol correspondiente.
- Los resultados pueden depender de la configuración concreta de VirtualBox, adaptadores de red y estado de arranque de las máquinas virtuales.
- La identificación del sistema operativo mediante Nmap debe considerarse una estimación técnica, no una confirmación absoluta.
- La información obtenida durante el reconocimiento será utilizada únicamente para orientar el análisis posterior de vulnerabilidades.

---

## Evidencias iniciales generadas

Durante la fase de preparación y reconocimiento inicial se han generado las siguientes evidencias:

| Evidencia | Descripción |
|---|---|
| `evidencias/entorno/kali_hostnamectl.txt` | Información del sistema atacante Kali Linux |
| `evidencias/entorno/kali_uname.txt` | Kernel y arquitectura del sistema atacante |
| `evidencias/entorno/kali_ip_a.txt` | Interfaces e IPs de la máquina atacante |
| `evidencias/entorno/kali_ip_route.txt` | Rutas de red de la máquina atacante |
| `evidencias/reconocimiento/descubrimiento_red.txt` | Descubrimiento de hosts activos en la red Host-only |
| `evidencias/reconocimiento/ping_kioptrix.txt` | Validación de conectividad con Kioptrix |
| `evidencias/nmap/puertos_comunes.txt` | Escaneo inicial de puertos TCP comunes |
| `evidencias/nmap/versiones_servicios.txt` | Detección de versiones de servicios |
| `evidencias/nmap/sistema_operativo.txt` | Fingerprinting de sistema operativo |
| `evidencias/nmap/puertos_completos.txt` | Escaneo completo de puertos TCP |

---

## Consideraciones legales y éticas

Esta evaluación tiene finalidad exclusivamente académica, defensiva y formativa. El equipo trabajará bajo los principios de autorización, mínimo impacto, trazabilidad y reproducción controlada.

Todas las pruebas se realizarán únicamente contra la máquina vulnerable Kioptrix Level 1, desplegada en un laboratorio local virtualizado y aislado. Cualquier acción fuera del alcance definido queda expresamente prohibida.

El uso de herramientas ofensivas solo estará permitido dentro del laboratorio autorizado y con objetivo pedagógico. No se generará malware, persistencia, evasión, denegación de servicio ni exfiltración real de información sensible.

La evaluación se documentará mediante logs, salidas de comandos y evidencias reproducibles, de forma que los resultados puedan ser revisados y validados posteriormente por el equipo y por el profesorado.