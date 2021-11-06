/ip firewall nat
add action=src-nat chain=srcnat comment="src-nat - isp1 uplink" out-interface=ether1-isp1 to-addresses=192.168.1.2
add action=src-nat chain=srcnat comment="src-nat - isp2 uplink" out-interface=ether2-isp2 to-addresses=192.168.0.2
add action=src-nat chain=srcnat comment="src-nat - isp3 uplink" out-interface=eth10.550-isp3 to-addresses=192.168.99.1
add action=src-nat chain=srcnat comment="src-nat - hairpin pc to vm range" dst-address=192.168.11.0/24 protocol=tcp src-address=192.168.10.2 to-addresses=192.168.11.254
add action=src-nat chain=srcnat comment="src-nat - dns poisoning" connection-mark=serum-secure to-addresses=192.168.254.101
add action=src-nat chain=srcnat connection-mark=serum-free to-addresses=192.168.254.102
add action=src-nat chain=srcnat connection-mark=serum-iot to-addresses=192.168.254.103
add action=src-nat chain=srcnat connection-mark=serum-work to-addresses=192.168.254.104
add action=redirect chain=dstnat comment="dst-nat - pi-hole is down" disabled=yes dst-address=192.168.11.11 dst-port=53 in-interface-list=!WAN protocol=udp to-ports=53
add action=redirect chain=dstnat comment="dst-nat - pi-hole is down" disabled=yes dst-address=192.168.11.11 dst-port=53 in-interface-list=!WAN protocol=tcp to-ports=53
add action=dst-nat chain=dstnat comment="dst-nat - dns serum" dst-address=!192.168.11.11 dst-port=53 in-interface-list=FREE log-prefix=serum-free protocol=udp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address=!192.168.11.11 dst-port=53 in-interface-list=FREE log-prefix=serum-free protocol=tcp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address=!192.168.11.11 dst-address-list=!dns-upstream dst-port=53 in-interface-list=SECURE log=yes log-prefix=serum-secure protocol=udp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address=!192.168.11.11 dst-address-list=!dns-upstream dst-port=53 in-interface-list=SECURE log=yes log-prefix=serum-secure protocol=tcp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address-list=!dns-work dst-port=53 in-interface-list=WORK log=yes log-prefix=serum-work protocol=udp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address-list=!dns-work dst-port=53 in-interface-list=WORK log=yes log-prefix=serum-work protocol=tcp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address=!192.168.11.11 dst-port=53 in-interface-list=IOT log=yes log-prefix=serum-iot protocol=udp to-addresses=192.168.11.11 to-ports=53
add action=dst-nat chain=dstnat dst-address=!192.168.11.11 dst-port=53 in-interface-list=IOT log=yes log-prefix=serum-iot protocol=tcp to-addresses=192.168.11.11 to-ports=53
