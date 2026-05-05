#!/usr/bin/env bash

# Escaneo web basico y controlado con Nikto para un objetivo autorizado.
# Uso: bash scripts/run_web_scan.sh <URL_O_IP>
# No realiza fuzzing agresivo, explotacion ni pruebas destructivas.

set -u

usage() {
  echo "Uso: $0 <URL_O_IP>"
  echo "Ejemplo: $0 http://192.168.56.101"
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

TARGET="$1"

if [[ -z "$TARGET" || "$TARGET" =~ [[:space:]] ]]; then
  echo "[!] Objetivo no valido. Usa una URL o IP sin espacios."
  usage
  exit 1
fi

if ! command -v nikto >/dev/null 2>&1; then
  echo "[!] Nikto no esta instalado o no esta en PATH."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="$PROJECT_ROOT/evidencias/nikto/$TIMESTAMP"
OUT_FILE="$OUT_DIR/nikto_basico.txt"

mkdir -p "$OUT_DIR"

echo "[*] Objetivo web autorizado: $TARGET"
echo "[*] Directorio de evidencias: $OUT_DIR"
echo "[*] Inicio de escaneo web basico y controlado."

# -nointeractive evita prompts.
# -maxtime limita la duracion para reducir impacto en laboratorio.
# -Format txt y -output guardan una evidencia legible.
nikto -h "$TARGET" -nointeractive -maxtime 10m -Format txt -output "$OUT_FILE"
STATUS=$?

if [[ $STATUS -ne 0 ]]; then
  echo "[!] Nikto devolvio codigo $STATUS. Revisa la evidencia: $OUT_FILE"
fi

echo
echo "[*] Escaneo web finalizado. Archivo generado:"
echo "    $OUT_FILE"
echo
echo "[*] Registra el comando y la ruta en anexos/comandos_ejecutados.md."
