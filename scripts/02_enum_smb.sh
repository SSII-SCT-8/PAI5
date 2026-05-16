#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 02: Enumeracion SMB y Samba
# Rol 2 - Ejecutar desde Kali Linux

TARGET="192.168.56.101"
OUT="$HOME/PAI5-Rol2/evidencias/enum4linux"

echo "[*] Enumerando SMB/Samba en $TARGET..."
enum4linux -a "$TARGET" | tee "$OUT/enum4linux_completo.txt"

echo "[*] Listando recursos compartidos SMB..."
smbclient -L "//$TARGET" -N 2>&1 | tee "$OUT/smbclient_shares.txt"

echo "[*] Enumerando servicios RPC..."
rpcinfo -p "$TARGET" 2>&1 | tee "$OUT/rpcinfo.txt"

echo "[*] Confirmando version Samba con Metasploit..."
msfconsole -q -x "use auxiliary/scanner/smb/smb_version; set RHOSTS $TARGET; run; exit" 2>&1 | tee "$OUT/smb_version.txt"

echo "[*] Evidencias guardadas en $OUT"
