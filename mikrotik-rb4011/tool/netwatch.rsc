/tool netwatch
add comment=pi-hole down-script="/ip firewall nat enable [find where comment=\"dst-nat - pi-hole is down\"]\r\
    \n:log info \"pi-hole is gone!\"" host=192.168.11.11 interval=5s up-script="/ip firewall nat disable [find where comment=\"dst-nat - pi-hole is down\"]\r\
    \n:log info \"pi-hole is back!\""