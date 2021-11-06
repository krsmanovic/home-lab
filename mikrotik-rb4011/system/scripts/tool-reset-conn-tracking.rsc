/ip firewall connection tracking set enabled=no
:delay delay-time=3s
/ip firewall connection remove [find]
:delay delay-time=10s
/ip firewall connection tracking set enabled=yes