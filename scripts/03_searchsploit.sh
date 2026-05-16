#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 03: Busqueda de exploits con SearchSploit
# Rol 2 - Ejecutar desde Kali Linux

OUT="$HOME/PAI5-Rol2/evidencias/searchsploit"

echo "[*] Buscando exploits para Samba 2.2..."
searchsploit samba 2.2 | tee "$OUT/searchsploit_samba.txt"

echo "[*] Buscando exploits para mod_ssl 2.8..."
searchsploit mod_ssl 2.8 | tee "$OUT/searchsploit_modssl.txt"

echo "[*] Buscando exploits para OpenSSH 2.9..."
searchsploit openssh 2.9 | tee "$OUT/searchsploit_ssh.txt"

echo "[*] Buscando exploits para Apache 1.3.20..."
searchsploit apache 1.3.20 | tee "$OUT/searchsploit_apache.txt"

echo "[*] Evidencias guardadas en $OUT"
