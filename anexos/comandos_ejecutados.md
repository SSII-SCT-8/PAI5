# Registro de Comandos Ejecutados

Este documento recoge los comandos relevantes ejecutados durante la fase de preparación del entorno, descubrimiento de red, reconocimiento inicial y fingerprinting del sistema objetivo **Kioptrix Level 1**.

El objetivo de este registro es garantizar la **trazabilidad**, **reproducibilidad** y **auditoría técnica** de las acciones realizadas durante el PAI 5 - RedTeamPro.

No se deben registrar ni ejecutar comandos contra objetivos fuera del alcance definido en `scope.md`.

---

## Contexto del laboratorio

| Campo | Valor |
|---|---|
| Máquina atacante | Kali Linux |
| IP atacante NAT | `10.0.2.15/24` |
| IP atacante Host-only | `192.168.56.101/24` |
| Interfaz de laboratorio | `eth1` |
| Máquina objetivo definitiva | Kioptrix Level 1 |
| IP objetivo definitiva | `192.168.56.102` |
| Red de laboratorio | `192.168.56.0/24` |
| Tipo de red | Host-only / red interna aislada |
| Responsable de la fase | Juan Cardesa |
| Rol | Planificación, metodología y reconocimiento |

---

## Registro de comandos

| Fecha/hora | Responsable | Objetivo | Comando | Resultado esperado | Resultado obtenido | Evidencia | Observaciones |
|---|---|---|---|---|---|---|---|
| 2026-05-11 05:16 | Juan Cardesa | Descubrir hosts activos en la red Host-only | `nmap -sn 192.168.56.0/24 -oN evidencias/reconocimiento/descubrimiento_red.txt` | Identificar hosts activos en la red de laboratorio | Se detectan 2 hosts activos: `192.168.56.100` y `192.168.56.101`. Inicialmente se toma `192.168.56.100` como candidato a sistema objetivo y `192.168.56.101` como Kali | `evidencias/reconocimiento/descubrimiento_red.txt` | Reconocimiento no destructivo. Posteriormente se revisa la identificación del objetivo al aparecer un nuevo host |
| 2026-05-11 05:37 | Juan Cardesa | Realizar escaneo inicial de puertos sobre el primer candidato | `sudo nmap -sS -T3 192.168.56.100 -oN evidencias/nmap/puertos_comunes.txt` | Identificar puertos TCP abiertos en el candidato inicial | El host responde, pero los 1000 puertos analizados aparecen filtrados con `proto-unreach` | `evidencias/nmap/puertos_comunes.txt` | Resultado no coherente con Kioptrix Level 1. Se decide revisar la configuración de red y validar de nuevo el objetivo |
| 2026-05-11 05:38 | Juan Cardesa | Validar conectividad con el primer candidato | `ping -c 4 192.168.56.100` | Confirmar comunicación ICMP con el host detectado | 4 paquetes transmitidos, 4 recibidos, 0% de pérdida | `evidencias/reconocimiento/ping_192.168.56.100.txt` | El host responde, pero no se confirma como Kioptrix debido al resultado anómalo del escaneo de puertos |
| 2026-05-11 05:38 | Juan Cardesa | Comprobar correspondencia ARP del host detectado | `arp -a` | Obtener la dirección MAC asociada al host activo | `192.168.56.100` aparece asociado a la MAC `08:00:27:87:f4:04` sobre `eth1` | `evidencias/reconocimiento/tabla_arp.txt` | Evidencia de conectividad en la red Host-only |
| 2026-05-11 05:38 | Juan Cardesa | Repetir escaneo TCP mediante conexión completa | `nmap -sT -Pn -T3 192.168.56.100 -oN evidencias/nmap/puertos_comunes_sT.txt` | Verificar si el resultado filtrado se debía al tipo de escaneo SYN | Los 1000 puertos analizados vuelven a aparecer filtrados con `proto-unreach` | `evidencias/nmap/puertos_comunes_sT.txt` | Se descarta continuar con `192.168.56.100` como objetivo principal hasta revisar la red |
| 2026-05-11 05:54 | Juan Cardesa | Repetir descubrimiento de hosts tras revisar la configuración de red | `nmap -sn 192.168.56.0/24 -oN evidencias/reconocimiento/descubrimiento_red.txt` | Identificar todos los hosts activos en la red Host-only | Se detectan 3 hosts activos: `192.168.56.100`, `192.168.56.101` y `192.168.56.102`. Se identifica `192.168.56.101` como Kali y `192.168.56.102` como candidato real a Kioptrix | `evidencias/reconocimiento/descubrimiento_red.txt` | La aparición de `192.168.56.102` permite corregir la identificación del sistema objetivo |
| 2026-05-11 05:56 | Juan Cardesa | Validar conectividad con Kioptrix Level 1 | `ping -c 4 192.168.56.102 > evidencias/reconocimiento/ping_kioptrix.txt` | Confirmar comunicación entre Kali y Kioptrix | 4 paquetes transmitidos, 4 recibidos, 0% de pérdida | `evidencias/reconocimiento/ping_kioptrix.txt` | Conectividad correcta con el objetivo definitivo |
| 2026-05-11 05:56 | Juan Cardesa | Identificar puertos TCP abiertos en Kioptrix | `sudo nmap -sS -T3 192.168.56.102 -oN evidencias/nmap/puertos_comunes.txt` | Obtener puertos abiertos iniciales del sistema objetivo | Se identifican abiertos los puertos `22`, `80`, `111`, `139`, `443` y `32768` | `evidencias/nmap/puertos_comunes.txt` | Escaneo SYN moderado. Resultado coherente con Kioptrix Level 1 |
| 2026-05-11 05:57 | Juan Cardesa | Detectar versiones de servicios expuestos | `sudo nmap -sV -sC -T3 -p 22,80,111,139,443,32768 192.168.56.102 -oN evidencias/nmap/versiones_servicios.txt` | Obtener versiones de los servicios abiertos | Se identifican OpenSSH 2.9p2, Apache 1.3.20, mod_ssl/2.8.4, OpenSSL/0.9.6b, rpcbind v2, Samba smbd y status RPC | `evidencias/nmap/versiones_servicios.txt` | Resultado clave para el análisis de vulnerabilidades del Rol 2 |
| 2026-05-11 06:01 | Juan Cardesa | Detectar sistema operativo del objetivo | `sudo nmap -O 192.168.56.102 -oN evidencias/nmap/sistema_operativo.txt` | Obtener una estimación del sistema operativo de Kioptrix | Nmap identifica el objetivo como un sistema Linux 2.4.X, concretamente Linux 2.4.9 - 2.4.18, con distancia de red de 1 salto | `evidencias/nmap/sistema_operativo.txt` | Fingerprinting activo de sistema operativo |
| 2026-05-11 06:02 | Juan Cardesa | Realizar escaneo completo de puertos TCP | `sudo nmap -p- -T3 192.168.56.102 -oN evidencias/nmap/puertos_completos.txt` | Confirmar si existen más puertos TCP abiertos fuera de los 1000 puertos comunes | Se confirman abiertos únicamente los puertos `22`, `80`, `111`, `139`, `443` y `32768`. No se detectan puertos TCP adicionales | `evidencias/nmap/puertos_completos.txt` | Escaneo TCP completo moderado sobre el sistema objetivo |

---

## Nota sobre la identificación inicial del objetivo

Durante la fase inicial de descubrimiento se detectó `192.168.56.100` como primer candidato a sistema objetivo. Sin embargo, los resultados obtenidos en los escaneos de puertos no fueron coherentes con el comportamiento esperado de Kioptrix Level 1, ya que todos los puertos aparecían filtrados con `proto-unreach`.

Tras revisar la configuración de red de VirtualBox y repetir el descubrimiento de hosts, se detectó un nuevo host activo en la red Host-only: `192.168.56.102`. Este host sí presentó una superficie de servicios coherente con Kioptrix Level 1, incluyendo los puertos `22`, `80`, `111`, `139`, `443` y `32768`.

Por tanto, se estableció `192.168.56.102` como **sistema objetivo definitivo**.

---

## Resumen técnico del reconocimiento

| Elemento | Resultado |
|---|---|
| IP atacante Host-only | `192.168.56.101` |
| IP objetivo definitiva | `192.168.56.102` |
| Red de laboratorio | `192.168.56.0/24` |
| Puertos TCP abiertos | `22`, `80`, `111`, `139`, `443`, `32768` |
| Sistema operativo estimado | Linux 2.4.X |
| Distancia de red | 1 salto |
| MAC objetivo | `08:00:27:D0:82:25` |
| Herramienta principal | Nmap 7.98 |

---

## Observaciones sobre el fingerprinting

Como parte del fingerprinting activo, se ejecutó una detección de sistema operativo mediante Nmap sobre el objetivo `192.168.56.102`.

El resultado identificó el sistema como un dispositivo de propósito general ejecutando **Linux 2.4.X**, con una estimación concreta entre **Linux 2.4.9 y Linux 2.4.18**. La distancia de red detectada fue de **1 salto**, coherente con el despliegue en una red local Host-only dentro de VirtualBox.

Este resultado confirma que el sistema objetivo corresponde a una plataforma Linux antigua, lo que refuerza la necesidad de analizar servicios expuestos, versiones obsoletas y posibles vulnerabilidades conocidas asociadas.

---

## Criterios de registro

- Registrar únicamente comandos ejecutados dentro del laboratorio autorizado.
- Indicar fecha y hora aproximada de ejecución.
- Identificar siempre el responsable de la acción.
- Usar rutas relativas al proyecto para facilitar la revisión.
- No modificar evidencias originales una vez generadas.
- Registrar también comandos que produzcan resultados inesperados si aportan información relevante.
- Diferenciar entre errores de entorno, resultados anómalos y hallazgos de seguridad.
- No registrar ni ejecutar pruebas contra objetivos fuera de alcance.
- No incluir acciones destructivas, ataques de denegación de servicio, malware, persistencia, evasión ni exfiltración real de información.