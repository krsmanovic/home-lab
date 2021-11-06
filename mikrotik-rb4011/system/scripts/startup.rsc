:global isp1Active "false"
:global isp2Active "false"
:global isp3Active "false"

# Check for new firmware

:delay 60s;

:local oldfirm [/system routerboard get current-firmware];
:local newfirm [/system routerboard get upgrade-firmware];
:if ($oldfirm != $newfirm) do={
    /system routerboard upgrade
    :delay 30s;
    :log info "Firmware is updated from version $oldfirm to $newfirm. Restarting."
    /system reboot
}