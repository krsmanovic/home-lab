/ip dhcp-server
add address-pool=pool-secure authoritative=after-2sec-delay conflict-detection=no disabled=no interface=eth10.12-secure-wifi lease-time=4w2d name=dhcp-secure
add address-pool=pool-stan10 authoritative=after-2sec-delay disabled=no interface=eth10.110-stan10 lease-time=4w2d name=dhcp-stan10
add address-pool=pool-stan09 authoritative=after-2sec-delay disabled=no interface=eth10.109-stan09 lease-time=4w2d name=dhcp-stan09
add address-pool=pool-vm dhcp-option-set=dhcp-option-set-vm disabled=no interface=eth10.10-pc lease-time=3d name=dhcp-vm
add address-pool=pool-gosti disabled=no interface=eth10.119-gosti lease-time=4w2d name=dhcp-gosti
add address-pool=pool-iot disabled=no interface=eth10.20-iot lease-time=4w2d name=dhcp-iot
add address-pool=pool-work disabled=no interface=eth10.13-work lease-time=4w2d name=dhcp-work

/ip dhcp-server network
add address=192.168.11.0/24 comment=vm dns-server=192.168.11.11 gateway=192.168.11.254
add address=192.168.12.0/24 comment="wifi secure" dns-server=192.168.11.11 gateway=192.168.12.254
add address=192.168.13.0/24 comment="wifi work" dns-server=192.168.11.11 gateway=192.168.13.254
add address=192.168.20.0/25 comment=iot dns-server=192.168.11.11 gateway=192.168.20.1
add address=192.168.109.0/25 comment="wifi 09" dns-server=192.168.11.11 gateway=192.168.109.1
add address=192.168.110.0/25 comment="wifi 10" dns-server=192.168.11.11 gateway=192.168.110.1
add address=192.168.119.0/25 comment="wifi 19" dns-server=192.168.11.11 gateway=192.168.119.1