#!/bin/bash
# PAI-5 RedTeamPro - ST-8
# Script 08: Recoleccion y empaquetado de evidencias
# Rol 2 - Ejecutar desde Kali Linux al finalizar todos los pasos

BASE="$HOME/PAI5-Rol2"
ZIP_NAME="PAI5-ST8-Rol2-evidencias.zip"

echo "[*] Comprobando estructura de evidencias..."
echo ""

for dir in evidencias/enum4linux evidencias/nikto evidencias/searchsploit evidencias/explotacion evidencias/post-explotacion logs; do
    count=$(ls "$BASE/$dir" 2>/dev/null | grep -v '\.gitkeep' | wc -l)
    echo "  $dir: $count fichero(s)"
done

echo ""
echo "[*] Empaquetando todo en $ZIP_NAME..."
cd "$HOME"
zip -r "$ZIP_NAME" PAI5-Rol2/

echo "[*] ZIP generado: $HOME/$ZIP_NAME"
echo ""
echo "[*] Levantando servidor HTTP para descarga desde Windows..."
echo "[*] Abre en tu navegador: http://$(hostname -I | awk '{print $1}'):8080"
echo "[*] Pulsa Ctrl+C cuando hayas descargado el ZIP"
cd "$HOME"
python3 -m http.server 8080
