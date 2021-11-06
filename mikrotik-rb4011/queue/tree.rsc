/queue tree
add max-limit=20M name="up isp2" parent=ether2-isp2 queue=ethernet-default
add max-limit=20M name="isp2 up secure" packet-mark=qos-up-secure parent="up isp2" priority=5 queue=ethernet-default
add max-limit=20M name="isp2 up free" packet-mark=qos-up-free parent="up isp2" queue=ethernet-default
add max-limit=5M name="up isp3" parent=eth10.550-isp3 queue=ethernet-default
add max-limit=5M name="isp3 up secure" packet-mark=qos-up-secure parent="up isp3" priority=5 queue=ethernet-default
add max-limit=100k name="isp3 up free" packet-mark=qos-up-free parent="up isp3" queue=ethernet-default
add max-limit=5M name="isp3 up work" packet-mark=qos-up-work parent="up isp3" priority=3 queue=ethernet-default
add max-limit=20M name="isp2 up work" packet-mark=qos-up-work parent="up isp2" priority=3 queue=ethernet-default
add max-limit=100k name="isp3 up iot" packet-mark=qos-up-iot parent="up isp3" priority=7 queue=ethernet-default
add max-limit=20M name="isp2 up iot" packet-mark=qos-up-iot parent="up isp2" priority=7 queue=ethernet-default
add max-limit=100M name="up isp1" parent=ether1-isp1 queue=ethernet-default
add max-limit=60M name="isp1 up free" packet-mark=qos-up-free parent="up isp1" queue=ethernet-default
add max-limit=100M name="isp1 up iot" packet-mark=qos-up-iot parent="up isp1" priority=7 queue=ethernet-default
add max-limit=100M name="isp1 up secure" packet-mark=qos-up-secure parent="up isp1" priority=5 queue=ethernet-default
add max-limit=100M name="isp1 up work" packet-mark=qos-up-work parent="up isp1" priority=3 queue=ethernet-default