/ip route
add comment="isp2 mark" distance=1 gateway=REDACTED routing-mark=route-isp2 scope=50
add comment="isp3 mark" distance=1 gateway=REDACTED routing-mark=route-isp3 scope=50
add check-gateway=ping comment="isp1 default gw" distance=2 gateway=REDACTED pref-src=192.168.1.2 scope=40 target-scope=30
add check-gateway=ping comment="isp2 default gw" distance=3 gateway=REDACTED pref-src=192.168.0.2 scope=40 target-scope=30
add comment="isp3 default gw" distance=4 gateway=REDACTED scope=40
add comment=RFC1918 distance=1 dst-address=10.0.0.0/8 type=unreachable
add comment="isp2 rekurzija" distance=1 dst-address=REDACTED gateway=192.168.0.1 scope=10
add comment=RFC3927 distance=1 dst-address=169.254.0.0/16 type=unreachable
add comment=RFC1918 distance=1 dst-address=172.16.0.0/12 type=unreachable
add comment=TEST-NET distance=1 dst-address=192.0.2.0/24 type=unreachable
add comment=RFC1918 distance=1 dst-address=192.168.0.0/16 type=unreachable
add comment=TEST-NET-2 distance=1 dst-address=198.51.100.0/24 type=unreachable
add comment=TEST-NET-3 distance=1 dst-address=203.0.113.0/24 type=unreachable
add comment="isp1 rekurzija" distance=1 dst-address=REDACTED gateway=192.168.1.1 scope=10