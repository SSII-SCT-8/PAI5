Durante la fase de preparación del entorno se identificó que la máquina atacante Kali Linux dispone de dos interfaces de red. La interfaz `eth0` se encuentra asociada a NAT con dirección `10.0.2.15/24`, mientras que la interfaz `eth1` se encuentra asociada a la red Host-only del laboratorio con dirección `192.168.56.101/24`.

El descubrimiento inicial de red mediante `nmap -sn 192.168.56.0/24` permitió identificar dos hosts activos en la red de laboratorio: `192.168.56.101`, correspondiente a Kali Linux, y `192.168.56.100`, identificado como el sistema objetivo Kioptrix Level 1.

| Elemento | Valor |
|---|---|
| Hipervisor | VirtualBox |
| Máquina atacante | Kali Linux |
| IP atacante NAT | 10.0.2.15/24 |
| IP atacante Host-only | 192.168.56.101/24 |
| Interfaz de laboratorio | eth1 |
| Máquina objetivo | Kioptrix Level 1 |
| IP objetivo | 192.168.56.100 |
| Red de laboratorio | 192.168.56.0/24 |
| Tipo de red | Host-only / red interna aislada |
| Enfoque | Black Box |

