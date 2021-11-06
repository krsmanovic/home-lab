:for i from=10 to=20 step=1 do={
	/ip dns static add address="192.168.254.$i" comment="secured vpn" name="$i.secured-vpn.local" ttl=1w1d
}