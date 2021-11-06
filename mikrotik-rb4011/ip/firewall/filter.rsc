/ip firewall filter
add action=accept chain=forward comment="fw: optimize forward & input" connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=drop chain=forward connection-state=invalid
add action=drop chain=input connection-state=invalid
add action=jump chain=forward comment="fw: fwd" jump-target=firewall-forward
add action=accept chain=firewall-forward dst-address=192.168.11.11
add action=jump chain=firewall-forward jump-target=firewall-icmp protocol=icmp
add action=drop chain=firewall-forward dst-address=192.168.0.0/23 in-interface-list=!SECURE
add action=accept chain=firewall-forward out-interface-list=WAN
add action=accept chain=firewall-forward in-interface-list=SECURE
add action=drop chain=firewall-forward log=yes log-prefix=non-wan
add action=jump chain=input comment="fw: lan" in-interface-list=!WAN jump-target=firewall-lan
add action=accept chain=firewall-lan dst-port=161,5678,20561 in-interface-list=SECURE protocol=udp
add action=jump chain=firewall-lan jump-target=firewall-icmp protocol=icmp
add action=accept chain=firewall-lan dst-port=53,67 protocol=udp
add action=accept chain=firewall-lan dst-port=21,22,8291 in-interface-list=SECURE protocol=tcp
add action=accept chain=firewall-lan dst-port=53 protocol=tcp
add action=accept chain=firewall-lan dst-address=127.0.0.1 log-prefix=loopback src-address=127.0.0.1 src-address-type=""
add action=accept chain=firewall-lan comment=ether5-failsafe in-interface=ether5-failsafe
add action=drop chain=firewall-lan
add action=jump chain=input comment="fw: wan" in-interface-list=WAN jump-target=firewall-wan
add action=jump chain=firewall-wan jump-target=firewall-icmp protocol=icmp
add action=drop chain=firewall-wan
add action=accept chain=firewall-icmp comment="fw: icmp" icmp-options=8:0 protocol=icmp
add action=accept chain=firewall-icmp icmp-options=0:0 protocol=icmp
add action=accept chain=firewall-icmp icmp-options=3:0-255 protocol=icmp
add action=accept chain=firewall-icmp icmp-options=5:0-255 protocol=icmp
add action=accept chain=firewall-icmp icmp-options=11:0-255 protocol=icmp
add action=accept chain=firewall-icmp icmp-options=12:0-255 protocol=icmp
add action=accept chain=firewall-icmp in-interface-list=SECURE log=yes
add action=drop chain=firewall-icmp log=yes protocol=icmp