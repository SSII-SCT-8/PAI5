# Matriz de Riesgos

La matriz se usara para priorizar hallazgos del laboratorio Kioptrix Level 1 en el contexto ficticio del Ayuntamiento de Santa Marta. La severidad CVSS se complementara con el contexto del activo, exposicion y facilidad de explotacion.

## Criterios de probabilidad

| Nivel | Criterio |
|---|---|
| Baja | Requiere condiciones poco probables, acceso previo significativo o informacion no disponible en Black Box |
| Media | Puede reproducirse con condiciones razonables dentro del laboratorio autorizado |
| Alta | Es directamente accesible, tiene pasos claros o existe PoC/exploit publico aplicable |

## Criterios de impacto

| Nivel | Criterio |
|---|---|
| Bajo | Impacto limitado, sin compromiso relevante de confidencialidad, integridad o disponibilidad |
| Medio | Afecta parcialmente a servicios, informacion o configuracion del sistema |
| Alto | Puede comprometer el sistema, privilegios, datos relevantes o continuidad del servicio |

## Matriz de severidad

| Probabilidad \ Impacto | Bajo | Medio | Alto |
|---|---|---|---|
| Baja | Baja | Baja | Media |
| Media | Baja | Media | Alta |
| Alta | Media | Alta | Critica |

## Prioridades de correccion

| Prioridad | Criterio | Plazo orientativo |
|---|---|---|
| P1 - Inmediata | Severidad critica, explotacion sencilla, presencia en CISA KEV o impacto alto confirmado | Corregir lo antes posible |
| P2 - Alta | Severidad alta o CVSS elevado con servicio expuesto | Corregir en el corto plazo |
| P3 - Media | Severidad media o explotabilidad condicionada | Planificar correccion |
| P4 - Baja | Impacto bajo, baja probabilidad o mitigacion compensatoria suficiente | Corregir cuando sea viable |

## Factores adicionales de priorizacion

- Puntuacion CVSS y vector asociado.
- Existencia de CVE publico.
- Presencia en CISA KEV.
- Disponibilidad de exploit en Exploit-DB/SearchSploit.
- Servicio expuesto en red local.
- Impacto sobre confidencialidad, integridad y disponibilidad.
- Complejidad de mitigacion.

[PENDIENTE: aplicar la matriz a hallazgos reales.]
