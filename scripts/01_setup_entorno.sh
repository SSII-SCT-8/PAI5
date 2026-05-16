#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 01: Preparacion del entorno
# Rol 2 - Ejecutar desde Kali Linux

TARGET="192.168.56.101"
KALI="192.168.56.103"
BASE="$HOME/PAI5-Rol2"

mkdir -p "$BASE/evidencias/enum4linux"
mkdir -p "$BASE/evidencias/nikto"
mkdir -p "$BASE/evidencias/searchsploit"
mkdir -p "$BASE/evidencias/explotacion"
mkdir -p "$BASE/evidencias/post-explotacion"
mkdir -p "$BASE/logs"
mkdir -p "$BASE/anexos"

echo "[*] Verificando conectividad con $TARGET..."
ping -c 3 "$TARGET"

echo "[*] Entorno preparado en $BASE"
echo "[*] IP atacante: $KALI"
echo "[*] IP objetivo: $TARGET"
