# Matriz de Riesgos

## Probabilidad

| Nivel | Criterio |
|---|---|
| Baja | Requiere condiciones poco probables, acceso previo significativo o configuracion muy especifica |
| Media | Puede explotarse con condiciones razonables dentro del entorno evaluado |
| Alta | Es facilmente reproducible o esta expuesta de forma directa en el activo evaluado |

## Impacto

| Nivel | Criterio |
|---|---|
| Bajo | Afecta informacion limitada o tiene impacto operativo minimo |
| Medio | Puede afectar confidencialidad, integridad o disponibilidad de forma parcial |
| Alto | Puede comprometer el sistema, privilegios, datos relevantes o continuidad del servicio |

## Severidad resultante

| Probabilidad \ Impacto | Bajo | Medio | Alto |
|---|---|---|---|
| Baja | Baja | Baja | Media |
| Media | Baja | Media | Alta |
| Alta | Media | Alta | Critica |

## Criterios de priorizacion

La prioridad se asignara considerando:

- Severidad resultante de la matriz.
- Puntuacion CVSS cuando exista.
- Exposicion del servicio afectado.
- Existencia de CVE publico.
- Presencia en CISA KEV.
- Facilidad de explotacion dentro del laboratorio.
- Impacto sobre confidencialidad, integridad y disponibilidad.
- Existencia de mitigacion directa.

[PENDIENTE: ajustar criterios si el profesor exige una escala concreta.]
