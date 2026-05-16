#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 04: Analisis web con Nikto
# Rol 2 - Ejecutar desde Kali Linux

TARGET="192.168.56.101"
OUT="$HOME/PAI5-Rol2/evidencias/nikto"

echo "[*] Ejecutando Nikto sobre HTTP (puerto 80)..."
nikto -h "http://$TARGET" -o "$OUT/nikto_http.txt" -Format txt

echo "[*] Ejecutando Nikto sobre HTTPS (puerto 443)..."
nikto -h "https://$TARGET" -ssl -o "$OUT/nikto_https.txt" -Format txt

echo "[*] Evidencias guardadas en $OUT"
