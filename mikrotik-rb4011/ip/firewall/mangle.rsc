/ip firewall mangle
add action=mark-connection chain=forward comment=qos connection-mark=no-mark connection-state=new in-interface-list=SECURE new-connection-mark=qos-up-secure passthrough=yes
add action=mark-packet chain=forward connection-mark=qos-up-secure new-packet-mark=qos-up-secure passthrough=no
add action=mark-connection chain=forward connection-mark=no-mark connection-state=new in-interface-list=FREE new-connection-mark=qos-up-free passthrough=yes
add action=mark-packet chain=forward connection-mark=qos-up-free new-packet-mark=qos-up-free passthrough=no
add action=mark-connection chain=forward connection-mark=no-mark connection-state=new in-interface-list=WORK new-connection-mark=qos-up-work passthrough=yes
add action=mark-packet chain=forward connection-mark=qos-up-work new-packet-mark=qos-up-work passthrough=no
add action=mark-connection chain=forward connection-mark=no-mark connection-state=new in-interface-list=IOT new-connection-mark=qos-up-iot passthrough=yes
add action=mark-packet chain=forward connection-mark=qos-up-iot new-packet-mark=qos-up-iot passthrough=no
add action=mark-connection chain=prerouting comment="tripple wan: isp2" connection-state=new dst-address-list=bgp-isp2 in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address-list=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address-list=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address-list=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address-list=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address-list=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-state=new dst-address=REDACTED in-interface-list=!WAN new-connection-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting connection-mark=no-mark connection-state=new in-interface=ether2-isp2 new-connection-mark=route-isp2 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=route-isp2 in-interface-list=!WAN new-routing-mark=route-isp2 passthrough=yes
add action=mark-connection chain=prerouting comment="tripple wan: isp3" connection-mark=no-mark connection-state=new in-interface=eth10.550-isp3 new-connection-mark=route-isp3 passthrough=yes
add action=mark-routing chain=prerouting connection-mark=route-isp3 new-routing-mark=route-isp3 passthrough=yes
add action=jump chain=prerouting comment="dns filtering" dst-port=53 in-interface-list=!WAN jump-target=prerouting-dns protocol=udp
add action=jump chain=prerouting dst-port=53 in-interface-list=!WAN jump-target=prerouting-dns protocol=tcp
add action=accept chain=prerouting-dns dst-address=192.168.11.11
add action=accept chain=prerouting-dns dst-address-list=dns-upstream dst-port=53 protocol=udp src-address=192.168.11.11
add action=accept chain=prerouting-dns connection-mark=no-mark dst-address-list=dns-work in-interface-list=WORK
add action=mark-connection chain=prerouting-dns connection-mark=no-mark in-interface-list=FREE new-connection-mark=serum-free passthrough=yes
add action=mark-connection chain=prerouting-dns connection-mark=no-mark connection-state=new in-interface-list=SECURE new-connection-mark=serum-secure passthrough=yes
add action=mark-connection chain=prerouting-dns connection-mark=no-mark in-interface-list=WORK new-connection-mark=serum-work passthrough=yes
add action=mark-connection chain=prerouting-dns connection-mark=no-mark in-interface-list=IOT new-connection-mark=serum-iot passthrough=yes