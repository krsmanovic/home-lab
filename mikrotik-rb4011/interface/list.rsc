/interface list
add name=WAN
add name=SECURE
add name=FREE
add name=IOT
add name=WORK
add name=DISCOVERY

/interface list member
add interface=eth10.550-isp3 list=WAN
add interface=ether2-isp2 list=WAN
add interface=ether3 list=SECURE
add interface=eth10.109-stan09 list=FREE
add interface=eth10.110-stan10 list=FREE
add interface=eth10.12-secure-wifi list=SECURE
add interface=eth10.119-gosti list=FREE
add interface=eth10.20-iot list=IOT
add interface=eth10.13-work list=WORK
add interface=ether5-failsafe list=SECURE
add interface=ether10-poe-out list=SECURE
add interface=eth10.10-pc list=SECURE
add interface=ether1-isp1 list=DISCOVERY
add interface=ether3 list=DISCOVERY
add interface=ether10-poe-out list=DISCOVERY
add interface=ether5-failsafe list=DISCOVERY
add interface=eth10.10-pc list=DISCOVERY
add interface=ether1-isp1 list=WAN