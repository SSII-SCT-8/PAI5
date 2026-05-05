#!/usr/bin/env python3

"""Genera una plantilla CSV de hallazgos para el PAI5.

El script no usa librerias externas y no sobrescribe archivos existentes.
Si anexos/hallazgos.csv ya existe, crea una version con sufijo timestamp.
"""

from __future__ import annotations

import csv
from datetime import datetime
from pathlib import Path


COLUMNS = [
    "ID",
    "Nombre",
    "Activo",
    "Puerto",
    "Servicio",
    "Version",
    "CVE",
    "CVSS",
    "CWE",
    "MITRE_ATTCK",
    "Severidad",
    "Evidencia",
    "Impacto",
    "Mitigacion",
    "Prioridad",
    "Estado",
]


def output_path() -> Path:
    """Devuelve una ruta segura sin sobrescribir plantillas anteriores."""
    project_root = Path(__file__).resolve().parents[1]
    anexos_dir = project_root / "anexos"
    anexos_dir.mkdir(parents=True, exist_ok=True)

    base_path = anexos_dir / "hallazgos.csv"
    if not base_path.exists():
        return base_path

    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    return anexos_dir / f"hallazgos_{timestamp}.csv"


def main() -> None:
    path = output_path()

    with path.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(COLUMNS)
        writer.writerow([
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
            "PENDIENTE",
        ])

    print(f"Plantilla de hallazgos generada: {path}")


if __name__ == "__main__":
    main()
