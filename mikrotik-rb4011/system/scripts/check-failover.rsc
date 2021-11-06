:global isp1Active
:global isp2Active
:global isp3Active

:local getisp1State [/ip route get value-name=active [/ip route find where comment="isp1 default gw"]]
:local getisp2State [/ip route get value-name=active [/ip route find where comment="isp2 default gw"]]
:local getisp3State [/ip route get value-name=active [/ip route find where comment="isp3 default gw"]]

:if (($getisp1State = true) and ($isp1Active = false)) do {
    :log info "########################### FAILOVER LOGIC #############################"
	:log info "isp1 link is active. Purging leftover connections via inactive gateways."
	/ip firewall connection remove [find reply-dst-address~192.168.0.2]
	/ip firewall connection remove [find reply-dst-address~192.168.1.2]
	/ip dns set servers=REDACTED
    :log info "########################################################################"
	:set isp1Active $getisp1State
	:set isp2Active $getisp2State
	:set isp3Active $getisp3State
}

:if (($getisp2State = true) and ($isp2Active = false)) do {
    :log info "########################### FAILOVER LOGIC #############################"
	:log info "isp2 link is active. Purging leftover connections via inactive gateways."
	/ip firewall connection remove [find reply-dst-address~REDACTED]
	/ip firewall connection remove [find reply-dst-address~192.168.1.2]
	/ip dns set servers=REDACTED
    :log info "########################################################################"
	:set isp1Active $getisp1State
	:set isp2Active $getisp2State
	:set isp3Active $getisp3State
}

:if (($getisp3State = true) and ($isp3Active = false)) do {
    :log info "########################### FAILOVER LOGIC #############################"
	:log info "isp3 link is active. Purging leftover connections via inactive gateways."
	/ip firewall connection remove [find reply-dst-address~REDACTED]
	/ip firewall connection remove [find reply-dst-address~192.168.0.2]
	/ip dns set servers=REDACTED
    :log info "########################################################################"
	:set isp1Active $getisp1State
	:set isp2Active $getisp2State
	:set isp3Active $getisp3State
}
