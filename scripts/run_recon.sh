#!/usr/bin/env bash

# Reconocimiento no destructivo con Nmap para un objetivo autorizado.
# Uso: bash scripts/run_recon.sh <IP_OBJETIVO>
# No ejecuta explotacion, fuerza bruta, DoS ni acciones fuera de reconocimiento.

set -u

usage() {
  echo "Uso: $0 <IP_OBJETIVO>"
  echo "Ejemplo: $0 192.168.56.101"
}

is_valid_ipv4() {
  local ip="$1"
  local octet

  [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || return 1

  IFS='.' read -r -a parts <<< "$ip"
  for octet in "${parts[@]}"; do
    [[ "$octet" =~ ^[0-9]+$ ]] || return 1
    (( 10#$octet >= 0 && 10#$octet <= 255 )) || return 1
  done

  return 0
}

run_step() {
  local title="$1"
  local outfile="$2"
  shift 2

  echo "[*] $title"
  echo "[*] Salida: $outfile"
  "$@" > "$outfile" 2>&1
  local status=$?

  if [[ $status -ne 0 ]]; then
    echo "[!] La herramienta devolvio codigo $status. Revisa la evidencia: $outfile"
  fi
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

TARGET="$1"

if ! is_valid_ipv4 "$TARGET"; then
  echo "[!] IP objetivo no valida: $TARGET"
  usage
  exit 1
fi

if ! command -v nmap >/dev/null 2>&1; then
  echo "[!] Nmap no esta instalado o no esta en PATH."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
OUT_DIR="$PROJECT_ROOT/evidencias/nmap/$TIMESTAMP"

mkdir -p "$OUT_DIR"

echo "[*] Objetivo autorizado: $TARGET"
echo "[*] Directorio de evidencias: $OUT_DIR"
echo "[*] Inicio de reconocimiento no destructivo."

run_step \
  "Comprobacion de host activo" \
  "$OUT_DIR/01_host_discovery.txt" \
  nmap -sn "$TARGET"

run_step \
  "Escaneo de puertos comunes TCP" \
  "$OUT_DIR/02_puertos_comunes.txt" \
  nmap --top-ports 1000 -Pn -T3 "$TARGET"

run_step \
  "Deteccion ligera de versiones" \
  "$OUT_DIR/03_deteccion_versiones.txt" \
  nmap -sV --version-light -Pn -T3 "$TARGET"

echo "[*] La deteccion de sistema operativo puede requerir permisos elevados y puede no ser concluyente."
run_step \
  "Deteccion de sistema operativo si procede" \
  "$OUT_DIR/04_deteccion_so.txt" \
  nmap -O --osscan-limit -Pn -T3 "$TARGET"

echo
echo "[*] Reconocimiento finalizado. Archivos generados:"
echo "    $OUT_DIR/01_host_discovery.txt"
echo "    $OUT_DIR/02_puertos_comunes.txt"
echo "    $OUT_DIR/03_deteccion_versiones.txt"
echo "    $OUT_DIR/04_deteccion_so.txt"
echo
echo "[*] Registra los comandos y rutas en anexos/comandos_ejecutados.md."
