:delay delay-time=3

:local pptpCount [interface pptp-server print count-only]
:local ovpnCount [interface ovpn-server print count-only]
:local l2tpCount [interface l2tp-server print count-only]

:if ($ovpnCount != 0) do {
    :foreach i in=[/interface ovpn-server find] do={
        :local clientNameOVPN [/interface ovpn-server get $i name]       
        :local clientAddrOVPN [/interface ovpn-server get $i client-address]
        :do { /ip firewall address-list add list=access-vpn-allow address=$clientAddrOVPN comment=$clientNameOVPN timeout=14d } on-error={}
	}
}

:if ($pptpCount != 0) do {
	:foreach i in=[/interface pptp-server find] do={
		:local clientNamePPTP [/interface pptp-server get $i name]       
		:local clientAddrPPTP [/interface pptp-server get $i client-address]
		:do { /ip firewall address-list add list=access-vpn-allow address=$clientAddrPPTP comment=$clientNamePPTP timeout=14d } on-error={}
	}
}

:if ($l2tpCount != 0) do {
	:foreach i in=[/interface l2tp-server find] do={
		:local clientNameL2TP [/interface l2tp-server get $i name]       
		:local clientAddrL2TP [/interface l2tp-server get $i client-address]
		:do { /ip firewall address-list add list=access-vpn-allow address=$clientAddrL2TP comment=$clientNameL2TP timeout=14d } on-error={}
	}
}