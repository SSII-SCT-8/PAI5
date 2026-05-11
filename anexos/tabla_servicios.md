# Tabla de Servicios Identificados

Este documento recoge los servicios identificados durante la fase de reconocimiento inicial sobre la máquina objetivo **Kioptrix Level 1**, desplegada en la red Host-only del laboratorio.

La información procede exclusivamente de evidencias reales obtenidas mediante Nmap sobre el objetivo `192.168.56.102`. No se marca ningún servicio como vulnerable en esta fase; únicamente se documentan servicios, versiones e indicios que deberán ser analizados posteriormente por el Rol 2.

## Datos del activo analizado

| Campo | Valor |
|---|---|
| Activo evaluado | Kioptrix Level 1 |
| IP objetivo | `192.168.56.102` |
| MAC objetivo | `08:00:27:D0:82:25` |
| Red de laboratorio | `192.168.56.0/24` |
| IP atacante | `192.168.56.101` |
| Herramienta principal | Nmap 7.98 |
| Evidencias principales | `evidencias/nmap/puertos_comunes.txt`, `evidencias/nmap/versiones_servicios.txt`, `evidencias/nmap/puertos_completos.txt` |

---

## Servicios TCP identificados

| Puerto | Protocolo | Servicio | Versión / información detectada | Estado | Evidencia | Observaciones |
|---:|---|---|---|---|---|---|
| 22 | TCP | SSH | OpenSSH 2.9p2, protocolo 1.99 | Abierto | `evidencias/nmap/versiones_servicios.txt` | El servidor soporta SSHv1. Requiere análisis posterior por tratarse de una tecnología obsoleta y potencialmente insegura |
| 80 | TCP | HTTP | Apache httpd 1.3.20 sobre Unix/Red Hat Linux, mod_ssl/2.8.4, OpenSSL/0.9.6b | Abierto | `evidencias/nmap/versiones_servicios.txt` | Servicio web principal. Nmap identifica el método HTTP TRACE como potencialmente riesgoso. Requiere revisión web posterior |
| 111 | TCP | rpcbind | rpcbind v2, RPC #100000 | Abierto | `evidencias/nmap/versiones_servicios.txt` | Servicio RPC utilizado para mapear servicios remotos. Puede facilitar enumeración de servicios disponibles |
| 139 | TCP | NetBIOS/SMB | Samba smbd, workgroup MYGROUP | Abierto | `evidencias/nmap/versiones_servicios.txt` | Servicio SMB/NetBIOS expuesto. Requiere enumeración posterior de recursos, versión y configuración |
| 443 | TCP | HTTPS | Apache/1.3.20 sobre Unix/Red Hat Linux, mod_ssl/2.8.4, OpenSSL/0.9.6b | Abierto | `evidencias/nmap/versiones_servicios.txt` | Servicio HTTPS asociado al mismo servidor Apache. Nmap detecta soporte de SSLv2 y certificado caducado/local |
| 32768 | TCP | status/RPC | status v1, RPC #100024 | Abierto | `evidencias/nmap/versiones_servicios.txt` | Servicio RPC asociado al puerto 111. Requiere análisis conjunto con rpcbind |

---

## Evidencias complementarias

| Evidencia | Resultado relevante |
|---|---|
| `evidencias/nmap/puertos_comunes.txt` | Identifica abiertos los puertos `22`, `80`, `111`, `139`, `443` y `32768` |
| `evidencias/nmap/versiones_servicios.txt` | Identifica versiones de servicios, cabeceras HTTP, soporte SSHv1, soporte SSLv2, certificado TLS y servicios RPC |
| `evidencias/nmap/sistema_operativo.txt` | Estima el sistema operativo como Linux 2.4.X, concretamente Linux 2.4.9 - 2.4.18 |
| `evidencias/nmap/puertos_completos.txt` | Confirma que no existen puertos TCP adicionales abiertos fuera de los ya identificados |

---

## Confirmación del escaneo completo

El escaneo completo de puertos TCP mediante:

```bash
sudo nmap -p- -T3 192.168.56.102 -oN evidencias/nmap/puertos_completos.txt