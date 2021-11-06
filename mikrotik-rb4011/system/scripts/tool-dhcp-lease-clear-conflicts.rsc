:local conflictLeases [/ip dhcp-server lease print count-only where status~"conflict"]

:if ($conflictLeases = 0) do={
    :log info "No conflicted DHCP leases."
} else={
    :foreach i in=[/ip dhcp-server lease find status=conflict] do={
        /ip dhcp-server lease remove $i
    }
    :log info "$conflictLeases conflicted DHCP leases removed."
}